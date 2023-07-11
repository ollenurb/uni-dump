#ifndef LIST_MERGE_H
#define LIST_MERGE_H

#include "list.h"

/*
** Merges two (ordered) list into another list that preserves the order of the elements (the new merged list is created)
** Criterio is a pointer to a function that SHOULD BE IMPLEMENTED, and represents
** the order relationship of the elements of the list.
**
** @param List *: A pointer of the first list that will be merged
** @param List *: A pointer of the second list that will be merged
** @param int(criterio(void*, void*)): Function pointer that should be implemented, see below its implementation is described above.
** @returns List *: The pointer of the new List that contains both first and second's elements ordered by {criterio].
*/
List *list_merge(List *, List *, int (criterio)(void *, void *));

/*
** Reorder the given list (passed as parameter) using insertion sort algorithm
** Criterio is a pointer to a function that SHOULD BE IMPLEMENTED, and represents
** the order relationship of the elements of the list.
**
** @param List *: A pointer of the list tha will be ordered
** @param int(criterio(void*, void*)): Function pointer that should be implemented, see below its implementation is described above.
*/
void list_insetion_sort(List *, int (criterio)(void *, void *));

#endif
