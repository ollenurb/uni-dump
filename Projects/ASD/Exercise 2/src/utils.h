#ifndef UTILS_H
#define UTILS_H

/*
** Minimum function with 3 (integer) parameters which returns the minimum integer between them.
** @param int: Value of the first integer.
** @param int: Value of the second integer.
** @param int: Value of the third integer.
** @return int: The minimum value between first, second and third integers.
*/
int min(int, int, int);

/*
** Function that creates and initialize a new matrix data structure in memory.
** @param int: Number of rows of the new matrix
** @param int: Number of columns of the new matrix
** @return int**: The pointer (address) of the allocated and initialized matrix.
*/
int **new_matrix(int, int);

/*
** Function that free the previously allocated (with new_matrix function) matrix.
** @param int**: The pointer of the previously allocated matrix.
** @param int: Number of rows of the matrix.
*/
void dispose_matrix(int **, int);

#endif
