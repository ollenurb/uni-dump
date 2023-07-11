#include "semutils.h"
#include <sys/types.h>
#include <sys/sem.h>
#include <stdlib.h>
#include "utils.h"


// Initialize semaphore to 1 (it represents an available semaphore)
int init_sem_av(int semid, int semnum) {
	union semun arg;

	arg.val = 1;
	return semctl(semid, semnum, SETVAL, arg);
}

// Initialize semaphore to 0 (it represents a currently used semaphore)
int init_sem_using(int semid, int semnum) {
	union semun arg;

	arg.val = 0;
	return semctl(semid, semnum, SETVAL, arg);
}

int reserve_sem(int semid, int semnum) {
	struct sembuf sops; // an element of semaphore operations

	sops.sem_num = semnum;
	sops.sem_op = -1;
	sops.sem_flg = 0;
	// The last parameter indicates the size of sops buffer
	return semop(semid, &sops, 1);
}

int release_sem(int semid, int semnum) {
	struct sembuf sops;

	sops.sem_num = semnum;
	sops.sem_op = 1;
	sops.sem_flg = 0;

	return semop(semid, &sops, 1);
}

/* Implements a barrier which waits nprocs to be done */
int barrier(int semid, int *count, int nprocs, int s1, int s2) {
	/* Critical section */
	if(reserve_sem(semid, s1) == -1) return -1;
	*count += 1;
	if(release_sem(semid, s1) == -1) return -1;
	/* End critical section */
	if(*count == nprocs)
		if(release_sem(semid, s2) == -1) return -1;

	if(reserve_sem(semid, s2) == -1) return -1;
	if(release_sem(semid, s2) == -1) return -1;
	return 0;
}
