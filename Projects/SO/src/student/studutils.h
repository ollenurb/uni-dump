#ifndef STUDUTILS_H
#define STUDUTILS_H

#include "../shared/utils.h"

void invite_matr(ipcs_data*, student);                                                  // Invite the given matr student
void refuse_all(ipcs_data*, int);                                                       // Refuse every invite that will be received, the 2nd parameter determines if it has to be blocking or not
void reply_matr(ipcs_data*, int, int);                                                  // Reply the given matr numebr
unsigned int pct_nof_elems(int, int, int);                                              // Returns the preference of the group using percentages passed as parameter
void add_to_group(ipcs_data *ipcs, int leader, int to_add, int close);                  // Add a specific matr to a group 

#endif
