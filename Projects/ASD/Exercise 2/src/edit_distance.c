#include "edit_distance.h"
#include "utils.h"
#include <string.h>


int edit_distance_rec(char *, char *, int, int);

int edit_distance(char *str1, char *str2) {
  if (str1 == NULL || str2 == NULL)
    return -1;

  int l1 = (int) strlen(str1);
  int l2 = (int) strlen(str2);
  int retval = edit_distance_rec(str1, str2, l1, l2);

  return retval;
}

int edit_distance_rec(char *str1, char *str2, int l1, int l2) {
  if (l1 == 0)
    return l2;

  if (l2 == 0)
    return l1;

  if (str1[l1 - 1] == str2[l2 - 1])
    return edit_distance_rec(str1, str2, l1 - 1, l2 - 1);
  else
    return 1 + min(edit_distance_rec(str1, str2, l1, l2 - 1),
                   edit_distance_rec(str1, str2, l1 - 1, l2),
                   edit_distance_rec(str1, str2, l1 - 1, l2 - 1));
}
