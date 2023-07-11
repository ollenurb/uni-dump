#include <stdio.h>
#include <stdlib.h>
#include <sys/shm.h>
#include <sys/msg.h>
#include <unistd.h>
#include <errno.h>
#include <signal.h>
#include <time.h>
#include "../shared/semutils.h"
#include "../shared/utils.h"
#include "../shared/stack.h"
#include "../shared/config.h"
#include "studutils.h"

ipcs_data *ipcs;
stack *valid_inv;                               /* Holds students that can be invited (tos always have the best vote) */

void dispose_memory();

/* Processo Studente */
int main(int argc, char *argv[]) {
        setbuf(stdout, NULL);
        sseed();

        config *conf;
        int invited = 0;                                /* Holds the number of invited students that haven't already answered */
        int shm_ipcs = atoi(argv[0]);                   /* Get semid passed as argument */
        int *count;                                     /* Shared mem segment to implement barrier */
        student *studs;                                 /* Array of students (information of every student that have been created) - (shmem)*/
        student *current;                               /* Holds the data of the current student process - (pointer to an element into shmem)*/
        int start_time, elapsed;                        /* They will be used to calculate the current elapsed time since the start */
        int is_closed = 0;                              /* Used to keep track of the group status (closed or not) */
        int members_count = 1;                          /* Used to track the number of members that I have */
        int is_leader = 0;                              /* Flag variable that defines if the current student is a leader or not */
        int aimed_increment = BASE_INCREMENT;           /* An increment to which everyone will try to get at the beginning */
        invite cur;                                     /* Will be used in msgrcv */

        if(signal(SIGTERM, dispose_memory) == SIG_ERR)
                throw_error("sigset error");

        /* Attach memory segments that have been passed as arguments */
        if((ipcs = shmat(shm_ipcs, NULL, 0)) == (void*) -1) throw_error("error while attaching (ipcs) memory segment");
	if((count = shmat(ipcs->shm_bar, NULL, 0)) == (void*) -1) throw_error("error while attaching (barrier) memory segment");
        if((studs = shmat(ipcs->shm_studs, NULL, 0)) == (void*) -1) throw_error("error while attaching (students) memory segment");
        if((conf = shmat(ipcs->shm_conf, NULL, 0)) == (void*) -1) throw_error("error while attaching (configuration) memory segment");

        /* Get the current student data only when the gestore process has finished filling the array of students */
        if(reserve_sem(ipcs->sem_list, STUDS_DATA) == -1) throw_error("error while reserving semaphore ");
        if(release_sem(ipcs->sem_list, STUDS_DATA) == -1) throw_error("error while releasing semaphore ");
        current = getstud(studs, pidtomat(getpid()));

        /* Compute the current preference based on the percentages into opt.conf */
        current->nof_elems = pct_nof_elems(conf->pct_n2, conf->pct_n3, conf->pct_n3);

        /* Initialize invites_left and rejects_left values */
        current->nof_invites = conf->nof_invites;
        current->max_reject = conf->max_reject;

        /* Calculate the set of valid invite based on my current matr, if it's even, then calculate a set of valid even matr, odds otherwhise */
        valid_inv = (current->matr & 1) ? stack_odds(studs) : stack_evens(studs);
        stack_sort(valid_inv);

        /* Prints current student stats */
        //printf("\n[%d] - Vote: %d - nof_elems: %d", current->matr, current->vote, current->nof_elems);

        /* A barrier is used in order to wait until every process has been initialized */
        if(barrier(ipcs->sem_list, count, POP_SIZE + 1, MUTEX, BARRIER) == -1)
                throw_error("barrier error");

        /* "Start" the timer of the student (fetch the current time) */
        start_time = time(NULL);

        /* Students begin their cycle */
        while(1)  {
                /* Calculate how much time has passed since the start */
                elapsed = elapsed_time(start_time);

                /* If the time is over 80% of the total, then close the group (even if you are alone) */
                if(get_percentage(conf->sim_time, elapsed) > 90) {
                        current->in_group = 1;
                        add_to_group(ipcs, current->matr, -1, 1);
                        refuse_all(ipcs, 0);
                }

                /* I have invited someone, then check if someone has answered */
                if(invited > 0) {
                        /* Checks if someone has answered my invites (only because I know that I invited someone) */
                        answer answ;
                        while(msgrcv(ipcs->msg_answers, &answ, (sizeof(answer) - sizeof(long)), current->matr, IPC_NOWAIT) != -1) {
                                if(answ.kind == ACCEPT) {
                                        current->in_group = 1;
                                        is_leader = 1;
                                        members_count += 1;
                                        if(members_count < current->nof_elems) {
                                                is_closed = 0;
                                        } else {
                                                is_closed = 1;
                                        }
                                        add_to_group(ipcs, current->matr, answ.from, is_closed);
                                }
                                invited -= 1;
                                if(is_closed == 1) {
                                        refuse_all(ipcs, 0);
                                }
                        } // end while
                } else if(is_leader != 1) {
                        /* If I haven't invited anyone, then it may be possible that I could have received some invites */
                        /* Evaluates received invites */
                        while((msgrcv(ipcs->msg_invites, &cur, (sizeof(invite) - sizeof(long)), current->matr, IPC_NOWAIT) != -1)) {
                                student *from = getstud(studs, cur.from);

                                /* If the time remaining is under 90% of the total, then evaluate invites */
                                if(get_percentage(conf->sim_time, elapsed) <= 90) {
                                        /* If the vote is a "good" vote, then accept invites based on the number of nof_elems */
                                        if(current->vote >= (MAX_VOTE - BASE_INCREMENT)){
                                                if(from->nof_elems == current->nof_elems || current->max_reject == 0) {
                                                        /* Here I decided to accept the invite, I can terminate */
                                                        reply_matr(ipcs, cur.from, ACCEPT);
                                                        current->in_group = 1;
                                                        /* When an invite is accepted, it enters in a blocking cycle that refuse every invite that is sent to 'me' */
                                                        refuse_all(ipcs, 0);
                                                } else {
                                                        reply_matr(ipcs, cur.from, REFUSE);
                                                        current->max_reject--;
                                                }
                                        } else {
                                                /* If the vote is below a "good" vote, then try to maximize it using projection */
                                                int projection = max(current->vote, from->vote);
                                                projection = (from->nof_elems != current->nof_elems) ? projection - 3 : projection;
                                                int increment = projection - current->vote;

                                                /* If the increment is sufficiently good for me, then accept*/
                                                if(increment >= aimed_increment || current->max_reject == 0) {
                                                        /* Here I decided to accept the invite, I can terminate */
                                                        reply_matr(ipcs, cur.from, ACCEPT);
                                                        current->in_group = 1;
                                                        refuse_all(ipcs, 0);
                                                } else {
                                                        reply_matr(ipcs, cur.from, REFUSE);
                                                        current->max_reject--;
                                                        aimed_increment--;
                                                }
                                        }
                                } else {
                                        /*  Here we assume that we have less than 10% of the simtime remaining, so we decide to accept everybody without valuating a possible future vote */
                                        reply_matr(ipcs, cur.from, ACCEPT);
                                        current->in_group = 1;
                                        refuse_all(ipcs, 0);
                                }
                        } /* end while */
                } else {
                        /* If you are a leader, then refuse every pending invite that you have received */
                        refuse_all(ipcs, IPC_NOWAIT);
                }

                /* If I want to invites someone... */
                if(current->nof_invites > 0 && invited == 0 && (get_percentage(conf->sim_time, elapsed) >= get_percentage(MAX_VOTE - MIN_VOTE, MAX_VOTE - current->vote))) {             // Invita solo dopo che gli altri studenti hanno risposto agli inviti inviati
                        /* We should get the best student that has no group */
                        student* best;
                        int cnt_group = 0;
                        do {
                                best = stack_pop(valid_inv);
                                cnt_group += 1;
                        } while(best->in_group == 1 && cnt_group <= valid_inv->tos);

                        invite fetched;
                        int kind = REFUSE;

                        /* If a group is */
                        if(current->in_group) {
                                refuse_all(ipcs, IPC_NOWAIT);
                                invite_matr(ipcs, *best);
                                invited++;
                                current->nof_invites -= 1;
                        } else {
                                while((msgrcv(ipcs->msg_invites, &fetched, (sizeof(invite) - sizeof(long)), current->matr, IPC_NOWAIT) != -1) && kind == REFUSE) {
                                        /* Accept if I have already received an invite from the student that I wanted to invite */
                                        kind = (fetched.from == best->matr) ? ACCEPT : REFUSE;

                                        if(kind == REFUSE)
                                                reply_matr(ipcs, fetched.from, kind);
                                }
                                /* Invite the best student */
                                if(kind == REFUSE) {
                                        invite_matr(ipcs, *best);
                                        invited++;
                                        current->nof_invites -= 1;
                                } else {
                                        current->in_group = 1;
                                        reply_matr(ipcs, fetched.from, kind);
                                        refuse_all(ipcs, 0);
                                }
                        }
                }
        } // end (infinite) while
}


void dispose_memory() {
        /* Free the stack from memory */
        stack_dispose(valid_inv);
        exit(EXIT_SUCCESS);
}
