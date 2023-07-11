#ifndef _SEMUTILS_H
#define _SEMUTILS_H

#define N_SEMS 3
#define MUTEX 0
#define BARRIER 1
#define STUDS_DATA 2


/* Union defined to operate whit IPC System V's semaphores */
union semun {
	int val;
	struct semid_ds *buf;
	unsigned short *array;
        #if defined(__linux__)
	      struct seminfo *__buf;
        #endif
};

int init_sem_av(int, int);                                              // Initialize the semaphore passed as argument as available
int init_sem_using(int, int);                                           // Initialize the semaphore passed as argument as using
int reserve_sem(int, int);                                              // Reserve the semaphore passed as argument
int release_sem(int, int);                                              // Release the semaphore passed as argument
int barrier(int, int*, int, int, int);                                  // Implements a thread barrier

#endif
