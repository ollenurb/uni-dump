#include "config.h"
#include <sys/types.h>

#ifndef _UTILS_H
#define _UTILS_H

#define POP_SIZE 50                                     // Number of students that will be created
#define MIN_VOTE 18                                     // Minimum vote allowed
#define MAX_VOTE 30                                     // Maximum vote allowed
#define STRT_MATR 800000                                // Starting matr number
#define STUD_EXEC "./student"                           // Path to student binary executable
#define GEST_EXEC "./gestore"                           // Path to gestore binary executable
#define STUD_ASIZ 2                                     // Size of student arguments array
#define BASE_INCREMENT 3                                // Base increment of each student
#define ACCEPT 1                                        // Represents ACCEPT kind of answer
#define REFUSE 0                                        // Represents REFUSE kind of answer

typedef struct ipcs_data {                              // Data structure that holds every reference of created IPCS
        unsigned int sem_list;                          // - Semaphores reference
        unsigned int shm_bar;                           // - Count shared memory for barrier
        unsigned int shm_conf;                          // - Config shared memory
        unsigned int shm_studs;                         // - Array of students shared memory
        unsigned int msg_invites;                       // - Message queue of invites
        unsigned int msg_answers;                       // - Message queue of messages
        unsigned int msg_gestore;                       // - Message queue to gestore
} ipcs_data;

typedef struct group {                                  // Struct that represents a group
        unsigned int max_vote;                          // - Maximum vote of the group
        unsigned int elements_count;                    // - Used to count the number of members
        unsigned int closed;                            // - Defines if the group is closed or still open
        unsigned int members[4];                        // - Here are saved the matr numbers of the members of the group
} group;

typedef struct student {                                // Struct that represents a single student
        unsigned int matr;                              // +====================================+
        unsigned int vote;                              // +====================================+
        unsigned int nof_elems;                         // +====================================+
        unsigned int nof_invites;                       // +====================================+
        unsigned int max_reject;                        // +====================================+
        unsigned int in_group;                          // Used to tell the program that this student is in a group or not
        unsigned int vote_SO;
} student;                                              // +====================================+

typedef struct invite {                                 // Struct that represents a single invite
        long mtype;                                     // - Represents receiver
        unsigned int from;                              // - Represents sender
} invite;

typedef struct answer {                                 // Struct that represents an answer
        long mtype;                                     // - Represents matr of the receiver
        unsigned int kind;                              // - Represents the kind of the answer (can only be refused or acceptde)
        unsigned int from;                              // - Represents the process which answered the invite
} answer;

typedef struct gest_message {                           // Represents a message to gestore
        long mtype;                                     // - Matr number of the leader process
        int to_add;                                     // - Matr number of the student which accepted the invite
        unsigned int to_close;                          // - Specify if the group have to be closed or not
} gest_message;

void cnfprint(config*);                                 // prints config struct passed as parameter
int rng_rand(int, int);                                 // Generate an integer random value between a given range (min, max)
void sseed();                                           // Sets random seed
void throw_error(char*);                                // Prints an error and errno and exit
char *itostr(int);                                      // Converts 'n' in an array of characters (string)
void init_stud(pid_t, student*);                        // Initialize cur student with given values
pid_t mattopid(int);                                    // Returns the correspondent matr number given pid
int pidtomat(pid_t);                                    // Returns the correspondent pid given matr number
student *getstud(student*, int);                        // Returns the address of the student that has the given matr number
int elapsed_time(unsigned int);                         // Returns the elapsed time (in seconds) since start_time
int get_percentage(int, int);                           // Returns the percentage of a given number
int max(int, int);


#endif
