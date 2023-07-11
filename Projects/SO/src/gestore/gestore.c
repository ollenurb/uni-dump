#include "../shared/config.h"
#include "../shared/utils.h"
#include "../shared/semutils.h"
#include "../shared/list.h"
#include <stdio.h>
#include <time.h>
#include <unistd.h>
#include <sys/wait.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/sem.h>
#include <sys/shm.h>
#include <sys/msg.h>
#include <signal.h>

void print_summary();
void assign_votes();
void exp_al();
void print_status(int, int);

int     sem_list,
        shm_bar,
        shm_studs,
        shm_conf,
        msg_invites,
        msg_gestore,
        msg_answers,
        shm_ipcs;

student *studs;
node *group_list = NULL;                                // Linked list to store groups

int main()
{
	pid_t cs_pid;
	int *count;
	ipcs_data *ipcs;
        gest_message msg_gest;
	config *conf;
	char *stud_argv[STUD_ASIZ];
        int group_count = 0;
        int start_time;

        /* Clear the screen */
        system("clear");
        /* Disable output buffering */
	setbuf(stdout, NULL);
        /* Sets an unique seed for drand48 */
	sseed();

	/* Set signal disposition to catch SIGINT (Ctrl+C) signals  */
	if(signal(SIGINT, exp_al) == SIG_ERR)
		throw_error("signal setting error");

	/* Set signal disposition to catch SIGALARM (simtime has elapsed) signal  */
	if(signal(SIGALRM, exp_al) == SIG_ERR)
		throw_error("signal setting error");

        /* Create a shared memory segment to store configuration data (fetched from the opt.conf file) */
        if((shm_conf = shmget(IPC_PRIVATE, sizeof(config), IPC_CREAT | 0666)) == -1)
                throw_error("error while creating shared memory segment for configuration data");

	/* Create a shared mem segment to store ipcs data */
	if((shm_ipcs = shmget(IPC_PRIVATE, sizeof(ipcs_data), IPC_CREAT | 0666)) == -1)
		throw_error("error while creating shared mem segment for ipcs_data");

	/* Create a semaphore list that holds utils semaphores */
	if((sem_list = semget(IPC_PRIVATE, N_SEMS, 0666 | IPC_CREAT)) == -1)
		throw_error("error while getting semaphore");

	/* Shared memory segment to store barrier's count variable */
	if((shm_bar = shmget(IPC_PRIVATE, sizeof(int), IPC_CREAT | 0666)) == -1)
		throw_error("error while creating shared mem segment");

	/* Shared memory segment to store student's data */
	if((shm_studs = shmget(IPC_PRIVATE, sizeof(student) * POP_SIZE, IPC_CREAT | 0666)) == -1)
		throw_error("error while creating shared mem segment");

	/* Message queue to send/get invites */
	if((msg_invites = msgget(IPC_PRIVATE, IPC_CREAT | 0666)) == -1)
		throw_error("error while creating invites message queue");

	/* Message queue to send/get invites */
	if((msg_answers = msgget(IPC_PRIVATE, IPC_CREAT | 0666)) == -1)
		throw_error("error while creating answers message queue");

        /* Message queue to send/get groups between gestore and students */
        if((msg_gestore = msgget(IPC_PRIVATE, IPC_CREAT | 0666)) == -1)
                throw_error("error while creating gestore message queue");

	/* Attach memory segments */
	if((count = shmat(shm_bar, NULL, 0)) == (void*) -1) throw_error("error while attaching (count) memory segment");
	if((studs = shmat(shm_studs, NULL, 0)) == (void*) -1) throw_error("error while attaching (students) memory segment");
	if((ipcs = shmat(shm_ipcs, NULL, 0)) == (void*) -1) throw_error("error while attaching (ipcs) memory segment");
        if((conf = shmat(shm_conf, NULL, 0)) == (void*) -1) throw_error("error while ataching (conf) memory segment");

        /* 'get_conf' fills the config's data structure values with opt.conf values */
	if(get_conf(conf) == -1)
		throw_error("error while fetching the configuration");

	/* Initialize counter for the barrier */
	*count = 0;
	/* Initialize ipcs_data shared memory structure */
	ipcs->sem_list = sem_list;
	ipcs->shm_bar = shm_bar;
	ipcs->shm_studs = shm_studs;
        ipcs->shm_conf = shm_conf;
	ipcs->msg_invites = msg_invites;
	ipcs->msg_answers = msg_answers;
        ipcs->msg_gestore = msg_gestore;

	/* Initialize semaphores */
	if(init_sem_av(sem_list, MUTEX) == -1) throw_error("initializing semaphore error");				// Number 0 is for the barrier mutual exclusion
	if(init_sem_using(sem_list, BARRIER) == -1) throw_error("initializing semaphore error");			// Number 1 is to implement barrier
	if(init_sem_av(sem_list, STUDS_DATA) == -1) throw_error("initializing semaphore error");			// Number 2 is to implement gestore/students sync

	/* Create the array of arguments in order to pass it to execv function */
	stud_argv[0] = itostr(shm_ipcs);
	stud_argv[1] = NULL;

	/* Every child that will be forked will wait until parent has finished its assignments */
	if(reserve_sem(sem_list, STUDS_DATA) == -1) throw_error("error while reserving semaphore 2");

	/* Fork POP_SIZE students */
	for(int i = 0; i < POP_SIZE; i++) {
		switch(cs_pid = fork()) {
			/* Execute child's code using execv */
			case 0:
				execv(STUD_EXEC, stud_argv);

			case -1:
				throw_error("fork error");
                        /* Create a new student and put it into stud array */
			default:
				init_stud(cs_pid, (studs + i));
				break;
		} // endwhile
	} // endfor

	/* Exit to notify that the array of students is ready */
	if(release_sem(sem_list, STUDS_DATA) == -1)
                throw_error("error while releasing semaphore studs data");

	/* Wait until the last child has been initialized */
	if(barrier(sem_list, count, POP_SIZE + 1, MUTEX, BARRIER) == -1)
		throw_error("barrier error");

	/* Alarm is set in order to start the simulation */
	alarm(conf->sim_time);
        start_time = time(NULL);

        /*
        ** The process is blocking listening in the queue of group creation/addition.
        ** Every message that is sent can reppresent the creation or an addition of an element to a specific group
        ** The groups are stored in a linked list, each group is then the data of a Node of the linked list
        */
        while(msgrcv(ipcs->msg_gestore, &msg_gest, (sizeof(msg_gest) - sizeof(long)), 0, 0) != -1) {
                print_status(group_count, (conf->sim_time - elapsed_time(start_time)));
                group *cur_group = is_present(group_list, msg_gest.mtype);

                if(cur_group == NULL) {
                        group_count++;
                        /* The group isn't still present in the group list, then create it and add it */
                        group new_group = {
                                .max_vote = 0,
                                .elements_count = 0,
                                .closed = 0,
                                .members = {-1, -1 , -1, -1}
                        };

                        new_group.members[new_group.elements_count++] = msg_gest.mtype;

                        /*
                        ** If I received a message to close, I just have to add the leader and then close the group if it doesn't exists
                        ** Every time that a student is added, the maximum vote of the groups is calculated and then stored into max_vote of the group
                        ** Note: The "close" message are characterized by the value of to_add, which is -1
                        */
                        if(msg_gest.to_add == -1) {
                                new_group.max_vote = getstud(studs, msg_gest.mtype)->vote;
                        } else {
                                new_group.max_vote = max(getstud(studs, msg_gest.mtype)->vote, getstud(studs, msg_gest.to_add)->vote);
                                new_group.members[new_group.elements_count++] = msg_gest.to_add;
                        }
                        new_group.closed = msg_gest.to_close;

                        /* Refresh the max_vote parameter of the group */
                        group_list = add(group_list, new_group);

                } else {
                        /* If to_add is -1, then it means that the group has to be closed without adding any element */
                        if(msg_gest.to_add != -1) {
                                cur_group->members[cur_group->elements_count++] = msg_gest.to_add;
                                cur_group->max_vote = max(cur_group->max_vote, getstud(studs, msg_gest.to_add)->vote);
                        }
                        cur_group->closed = msg_gest.to_close;
                }
        } /* End while (reading the msg_queue) */

}

/*
** This function is executed when the "alarm" timer expires
** It is responsible for freeing the memory and closing every ipcs that have been used
*/
void exp_al() {
	/* A signal to terminate is sent to every child */
	for(int i = 0; i < POP_SIZE; i++) {
                kill(mattopid(studs[i].matr), SIGTERM);
                waitpid(studs[i].matr, NULL, 0);
        }

        /* Print the summary of votes and average votes */
        assign_votes();
        print_summary();

	/* Closes every IPCS that have been used to communicate */
	if(semctl(sem_list, 0, IPC_RMID) == -1) throw_error("utils semaphores closing error");
	if(shmctl(shm_ipcs, 0, IPC_RMID) == -1) throw_error("sared memory ipcs closing error");
	if(shmctl(shm_bar, 0, IPC_RMID) == -1) throw_error("sared memory barrier closing error");
        if(shmctl(shm_conf, 0, IPC_RMID) == -1) throw_error("sared memory config closing error");
	if(shmctl(shm_studs, 0, IPC_RMID) == -1) throw_error("shared memory students close error");
	if(msgctl(msg_invites, IPC_RMID, NULL) == -1) throw_error("invites message queue close error");
	if(msgctl(msg_answers, IPC_RMID, NULL) == -1) throw_error("answers message queue close error");
        if(msgctl(msg_gestore, IPC_RMID, NULL) == -1) throw_error("gestore message queue close error");

        /* Free the group list from the memory */
        dispose_l(group_list);
	exit(EXIT_SUCCESS);
}

/*
** Print a summary of the simulation.
** It counts the number of students of each vote and when the counting is finished, it computes the average vote
*/
void print_summary() {
        system("clear");
        printf("\n+====================================================================================+");
        printf("\n|################################( RESOCONTO FINALE )################################|");
        printf("\n+=====================+====================++====================+===================+");
        printf("\n|      Voto AdE       |   Numero Studenti  ||      Voto SO       |  Numero Studenti  |");
        printf("\n+=====================+====================++====================+===================+");
        float sum_AdE = 0, sum_SO = 0;
        for(int i = 15; i <= 30; i++) {
                int c_AdE = 0, c_SO = 0;
                for(int j = 0; j < POP_SIZE; j++) {
                        if(studs[j].vote == i)
                                c_AdE++;

                        if(studs[j].vote_SO == i)
                                c_SO++;
                }
                printf("\n|%*s%2d%*s|", 9, "", i, 10, "");
                printf("%*s%2d%*s|", 9, "", c_AdE, 9, "");
                printf("|%*s%2d%*s|", 9, "", i, 9, "");
                printf("%*s%2d%*s|", 9, "", c_SO, 8, "");
        }
        for(int i = 0; i < POP_SIZE; i++) {
                sum_AdE += studs[i].vote;
                sum_SO += studs[i].vote_SO;
        }
        /* Calculate average votes and save the result into sum */
        sum_SO = sum_SO / POP_SIZE;
        sum_AdE = sum_AdE / POP_SIZE;
        printf("\n+=====================+====================++====================+===================+");
        printf("\n|      Media AdE      |");
        printf("%*s%4.*f%*s|", 7, "", 2, sum_AdE, 8, "");
        printf("|      Media  SO     |");
        printf("%*s%4.*f%*s|", 7, "", 2, sum_SO, 7, "");
        printf("\n+=====================+====================++====================+===================+\n\n");
        printf("L'incremento sulla media ottenuto e' di %.2f punti\n", sum_SO - sum_AdE);
}


/*
** Prints the current status of the simulation
** group_count is the number of the created groups
** remaining_time is the amount of remaining time (in seconds) of the simulation
*/
void print_status(int group_count, int remaining_time) {
        system("clear");
        printf("\n+===================================================+");
        printf("\n|##################( Simulazione )##################|");
        printf("\n+=============================+=====================+");
        printf("\n|        Gruppi creati        |");
        printf("%*s%3d%*s|", 9, "", group_count, 9, "");
        printf("\n+=============================+=====================+");
        printf("\n|        Tempo rimanente      |");
        printf("%*s%3d%*s|", 9, "", remaining_time, 9, "");
        printf("\n+=============================+=====================+");
}

/*
** This routine assigns a vote to every process that have been created
** If the group is not closed, the vote won't be assigned, and it will remain 0 (which is the default value of the vote)
*/
void assign_votes() {
        node *c_node = group_list;
        while(c_node != NULL) {
                group *c_group = c_node->data;
                /* Assign votes only if the group is closed */
                if(c_group->closed) {
                        for(int i = 0; i < c_group->elements_count; i++) {
                                student *c_student = getstud(studs, c_group->members[i]);
                                if(c_student->nof_elems != c_group->elements_count) {
                                        c_student->vote_SO =  c_group->max_vote - 3;
                                } else {
                                        c_student->vote_SO = c_group->max_vote;
                                }
                        }
                }
                c_node = c_node->next;
        }
}
