#include "edit_distance.h"
#include "utils.h"
#include <string.h>

int edit_distance_dyn_rec(char *, char *, int l1, int l2, int **);

int edit_distance_dyn(char *str1, char *str2) {
  if (str1 == NULL || str2 == NULL)
    return -1;

  int l1 = (int) strlen(str1);
  int l2 = (int) strlen(str2);

  int **values = new_matrix(l1, l2);

  int retvalue = edit_distance_dyn_rec(str1, str2, l1, l2, values);
  dispose_matrix(values, l1);

  return retvalue;
}

int edit_distance_dyn_rec(char *str1, char *str2, int l1, int l2, int **values) {
  //Auxiliary function for dynamic version of edit_distance
  if (l1 == 0)
    return l2;
  if (l2 == 0)
    return l1;

  if (str1[l1 - 1] == str2[l2 - 1])
    values[l1][l2] = edit_distance_dyn_rec(str1, str2, l1 - 1, l2 - 1, values);
  else {
    // The next value hasn't been calculated yet
    if (values[l1 - 1][l2 - 1] == -1) values[l1 - 1][l2 - 1] = edit_distance_dyn_rec(str1, str2, l1 - 1, l2 - 1, values) + 1;
    if (values[l1 - 1][l2] == -1) values[l1 - 1][l2] = edit_distance_dyn_rec(str1, str2, l1 - 1, l2, values) + 1;
    if (values[l1][l2 - 1] == -1) values[l1][l2 - 1] = edit_distance_dyn_rec(str1, str2, l1, l2 - 1, values) + 1;

    return values[l1][l2] = min(values[l1 - 1][l2 - 1],
                                values[l1 - 1][l2],
                                values[l1][l2 - 1]);
  }

  return values[l1][l2];
}
