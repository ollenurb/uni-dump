#ifndef EDIT_DISTANCE_H
#define EDIT_DISTANCE_H

/*
** Recursive edit distance function that returns the Levenshtein distance of 2 strings passed as parameters.
** @param char *: Pointer of the first string.
** @param char *: Pointer of the second string.
** @return int: The edit distance between first string and second string passed as parameter, -1 on error.
*/
int edit_distance(char *, char *);

/*
** Recursive edit distance function that uses dynamic programming that limits recursive calls.
** @param char *: Pointer of the first string.
** @param char *: Pointer of the second string.
** @return int: The edit distance between first string and second string passed as parameter, -1 on error.
*/
int edit_distance_dyn(char *, char *);


#endif
