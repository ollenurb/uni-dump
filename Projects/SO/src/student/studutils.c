#include "studutils.h"
#include <stdio.h>
#include <stdlib.h>
#include <sys/msg.h>
#include <unistd.h>

/* Send and invite to the student that has matr number */
void invite_matr(ipcs_data *ipcs, student stud) {
        invite inv;
        inv.mtype = stud.matr;
        inv.from = pidtomat(getpid());
        if(msgsnd(ipcs->msg_invites, &inv, (sizeof(invite) - sizeof(long)), 0) < 0)
                throw_error("invite send error");
}

/* Send a reply to the student that has matr number */
void reply_matr(ipcs_data *ipcs, int matr, int kind) {
        answer answ = {
                .mtype = matr,
                .kind = kind,
                .from = pidtomat(getpid())
        };

        if(msgsnd(ipcs->msg_answers, &answ, (sizeof(answ) - sizeof(long)), 0) < 0)
                throw_error("answer send error");
}

/* Returns 0 upon success, -1 otherwhise, sends a message to Gestore in order to create a new group or add a new member of the group */
void add_to_group(ipcs_data *ipcs, int leader, int to_add, int close) {
        gest_message msg = {
                .mtype = leader,
                .to_add = to_add,
                .to_close = close
        };

        if(msgsnd(ipcs->msg_gestore, &msg, (sizeof(gest_message) - sizeof(long)), 0) < 0)
                throw_error("msg to gestore error");
}

/* Refuse every pending invites that current student have (it doesn't count max_reject) */
void refuse_all(ipcs_data *ipcs, int blocking) {
        int matr = pidtomat(getpid());
        invite current;
        while((msgrcv(ipcs->msg_invites, &current, (sizeof(invite) - sizeof(long)), matr, blocking) != -1)) { // Ricevuto invito, allora rispondo
                reply_matr(ipcs, current.from, REFUSE);
        }
        // At this point we will have 0 pending invites
}

/* Return the preference number, using the percentages passed as arguments, -1 on error */
unsigned int pct_nof_elems(int pct_n2, int pct_n3, int pct_n4) {
        int number = rng_rand(0, 99);

        if(number >= 0 && number < pct_n2)
                return 2;
        else if(number >= pct_n2 && number < (pct_n2 + pct_n3))
                return 3;
        else if(number >= (pct_n2 + pct_n3) && number <= 99)
                return 4;
        else
                return -1;
}
