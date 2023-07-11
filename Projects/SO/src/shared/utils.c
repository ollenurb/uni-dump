#include "utils.h"
#include <stdlib.h>
#include <sys/time.h>
#include <stdio.h>
#include <errno.h>
#include <string.h>
#include <math.h>
#include <unistd.h>
#include <sys/types.h>
#include <time.h>

/* TEST: Prints the current config data structure */
void cnfprint(config *conf) {
	printf("sim_time: %d", conf->sim_time);
	printf("\npct_n2: %d", conf->pct_n2);
	printf("\npct_n3: %d", conf->pct_n3);
	printf("\npct_n4: %d", conf->pct_n4);
	printf("\nnof_invites %d", conf->nof_invites);
	printf("\nmax_reject: %d", conf->max_reject);
}

/* Generate a random number into a given range */
int rng_rand(int min, int max) {
	return (int) (rand() % ((max - min) + 1)) + min;
}

/* Set seed of srand48 in order to make more casual numbers */
void sseed() {
        struct timeval time;
        gettimeofday(&time,NULL);
        srand((unsigned int) time.tv_usec);
}

/* Print an error message and print errno */
void throw_error(char *errmsg) {
	printf("\n[Error]: %s", errmsg);
	printf("\n[Details]: %s", strerror(errno));
	exit(EXIT_FAILURE);
}

/* Returns the length of digits in an integer */
char *itostr(int n) {
	int digits = (n == 0) ? 1 : (int)((ceil(log10(n))+1)*sizeof(char));
	char *str = malloc(sizeof(n) * digits);
	sprintf(str, "%d", n);
	return str;
}

/* Initialize student with given pid */
void init_stud(pid_t pid, student *cur) {
	cur->matr = pidtomat(pid);
	cur->vote = rng_rand(MIN_VOTE, MAX_VOTE);
        cur->in_group = 0;                              // Initially every student doesn't have a proper group
        cur->nof_elems = 0;
        cur->vote_SO = 0;
	cur->in_group = 0;
}

/* Returns matr num given pid */
int pidtomat(pid_t pid) {
	return STRT_MATR + pid;
}

/* Returns pid given matr num */
pid_t mattopid(int matr) {
	return matr - STRT_MATR;
}

/* Return the address of the student of given matr into studs array */
student *getstud(student *studs, int matr) {
        while(studs->matr != matr)
                studs = studs + 1;

        return studs;
}

/* Get the elapsed time given the start time */
int elapsed_time(unsigned int start_time) {
        int current_time = time(NULL);
        return (current_time - start_time);
}

/* Get the percentage of a given time assuming that the 100% is sim_time */
int get_percentage(int sim_time, int elapsed) {
        return (int) ((elapsed * 100) / sim_time);
}

/* Returns the maximum number between a and b */
int max(int a, int b) {
        return (a >= b) ? a : b;
}
