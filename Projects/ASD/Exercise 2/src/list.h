#ifndef LIST_H
#define LIST_H

/*
** A List data structure that represents a countable number of ordered values,
** where the same value may occur more than once
*/
typedef struct _List List;

/*
** An iterator of the list, used to iterate through the list and retreive values.
*/
typedef struct _Iterator Iterator;

/*
** It creates an initialized empty list data structure
** @return: The pointer of the created list
*/
List *list_create();

/*
** Deallocate the list from the memory, the parameter is the List to dispose from the memory
** @param List *: The pointer of the list to dispose, which cannot be NULL
*/
void list_dispose(List *);

/*
** Insert a new element into the list by appending it after the tail of the list.
** @param List *: The pointer of the list in which the element will be added. Cannot be NULL or invalid.
** @param void *: The pointer of the element to add.
*/
void list_add_tail(List *, void *);

/*
** Insert a new element into the list in a particular given index
** @param List *: The pointer of the list in which the element will be added. Cannot be NULL or invalid.
** @param void *: The pointer of the element to add.
** @param int: The index on which the element should be added
*/
void list_add_i(List *, void *, int);

/*
** Test if a given list is empty.
** @param List *: The pointer of the list to test if it's empty. Cannot be NULL or invalid.
** @return: a value < 0 if empty, 0 otherwhise
*/
int list_is_empty(List *);

/*
** Get the number of the elements that has been added to the list.
** @param List *: The pointer of the list to get its elements count. Cannot be NULL or invalid.
** @return: An integer value that represents the number of elements of the list.
*/
int list_size(List *);

/*
** Remove the last element (tail) of a given list
** @param List *: The pointer of the list where to remove the tail. Cannot be NULL or invalid.
*/
void list_remove_tail(List *);

/*
** Remove an element in a praticulare index of a given list
** @param List *: The pointer of the list where to remove the element. Cannot be NULL or invalid.
** @param int: Index of the element to be removed (The index should be 0 <= index <= list_size)
*/
void list_remove_i(List *, int);

/*
** Get an element in a praticulare index of a given list
** @param List *: The pointer of the list where to retrieve the element. Cannot be NULL or invalid.
** @param int: Index of the element to be retrieved (The index should be 0 <= index <= list_size)
** @return: The pointer of the element that has been retrieved
*/
void *list_get_i(List *, int);

/*
** Creates a new iterator of the given list
** @param List *: The pointer of the list where to create the iterator. Cannot be NULL or invalid.
** @return: The addres of the iterator that has been created
*/
Iterator *list_get_iterator(List *);

/*
** Change the element pointed by the iterator to the next one
** @param Iterator *: The pointer of the iterator where to get the next element. Cannot be NULL or invalid.
*/
void iterator_next(Iterator *);

/*
** Test if an iterator is still valid (which means that it's pointing in a valid memory location)
** @param Iterator *: The pointer of the iterator to test if it's valid. Cannot be NULL or invalid.
** @return: (int) A value > 0 if it's valid, 0 otherwhise
*/
int iterator_is_valid(Iterator *);

/*
** Get the current element pointed by the iterator
** @param Iterator *: The pointer of the iterator where you want to retrieve the value. Cannot be NULL or invalid.
** @return: (void*) The pointer of the current element pointed by the iterator. NULL if the iterator is invalid
*/
void *iterator_get_element(Iterator *);

/*
** Destroy and free the memory of the iteratore passed as parameter.
** @param Iterator *: The pointer of the iterator to dispose. Cannot be NULL or invalid.
*/
void iterator_dispose(Iterator *);

/*
** Rewind the position of the iterator to the beginning of the list
** @param Iterator *: The pointer of the iterator to rewind. Cannot be NULL or invalid.
*/
void iterator_rewind(Iterator *);

/*
** Prints the list passed as parameter.
** The user should define a function called print_element which prints a single element.
** @param Iterator *: The pointer of the list to be printed. Cannot be NULL or invalid.
** @param void (print_element)(void*): The pointer of the function which should be defined by the user.
** This function should be implemented in order to print a single element of the list.
*/
void list_print(List *, void (print_element)(void *));

#endif
