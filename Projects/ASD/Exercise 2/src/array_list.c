#include "list.h"
#include <stdio.h>
#include <stdlib.h>

// Soglia sotto la quale l'array deve essere ridimensionato
#define MIN_PCT_EL 1/4
// Fattore moltiplicativo di crescrita dell'array
#define GROWTH_FACTOR 2
// Fattore moltiplicativo di riduzione dell'array
#define SHRINKING_FACTOR 1/2
// Grandezza iniziale di elementi dell'array
#define INITIAL_SIZE 100

struct _List {
  void **array_list;
  int element_count;
  int tail_index;
  int array_size;
};

struct _Iterator {
  int index;
  List *list;
};

void list_right_shift(List *, int);

void list_left_shift(List *, int);

void list_resize(List *, int);

void throw_error(char *string) {
  fprintf(stderr, "%s", string);
  exit(EXIT_FAILURE);
}

List *list_create() {
  List *new_list = (List *) malloc(sizeof(List));
  if (new_list == NULL)
    throw_error("malloc error: not enough space for a List object");
  new_list->array_list = (void **) malloc(sizeof(void *) * INITIAL_SIZE);
  if (new_list->array_list == NULL)
    throw_error("malloc error: not enough space for an array of void pointers");
  new_list->tail_index = -1;
  new_list->element_count = 0;
  new_list->array_size = INITIAL_SIZE;
  return new_list;
}

void list_dispose(List *to_dispose) {
  if (to_dispose == NULL)
    throw_error("invalid parameter: to_dispose parameter cannot be NULL value");

  free(to_dispose->array_list);
  free(to_dispose);
}

void list_add_tail(List *list, void *element) {
  if (list == NULL)
    throw_error("invalid parameter: list parameter cannot be NULL");

  if (element == NULL)
    throw_error("invalid parameter: element parameter cannot be NULL");

  if (list->element_count + 1 >= list->array_size) {
    // reallocate memory
    list_resize(list, list->array_size * GROWTH_FACTOR);
  }
  list->array_list[++list->tail_index] = element;
  list->element_count++;
}

void list_add_i(List *list, void *element, int index) {
  if (list == NULL)
    throw_error("invalid parameter: list parameter cannot be NULL");
  if (element == NULL)
    throw_error("invalid parameter: element parameter cannot be NULL");
  if (index < 0 || index >= list->element_count)
    throw_error("invalid parameter: invalid index value");

  if (list->element_count + 1 >= list->array_size) {
    // reallocate memory
    list_resize(list, list->array_size * GROWTH_FACTOR);
  }
  list_right_shift(list, index);
  list->array_list[index] = element;
  list->element_count++;
}

void list_right_shift(List *list, int to) {
  for (int i = list->tail_index; i >= to; i--) {
    list->array_list[i + 1] = list->array_list[i];
  }
  list->tail_index += 1;
}

void list_left_shift(List *list, int from) {
  for (int i = from; i < list->tail_index; i++) {
    list->array_list[i] = list->array_list[i + 1];
  }
  list->tail_index -= 1;
}

void list_resize(List *list, int new_size) {
  list->array_size = new_size;
  list->array_list = (void **) realloc(list->array_list, sizeof(void *) * (unsigned int) list->array_size);
  if (list->array_list == NULL)
    throw_error("realloc error: not enough memory to reallocate array_list");
}

void list_print(List *list, void (print_element)(void *)) {
  printf("\n");
  for (int i = 0; i < list->element_count; i++) {
    print_element(list->array_list[i]);
  }
}

int list_is_empty(List *list) {
  if (list == NULL)
    throw_error("invalid parameter: list parameter cannot be NULL");
  return list->element_count == 0;
}

int list_size(List *list) {
  if (list == NULL)
    throw_error("invalid parameter: list parameter cannot be NULL");
  return list->element_count;
}

void list_remove_tail(List *list) {
  if (list == NULL)
    throw_error("invalid parameter: list parameter cannot be NULL");

  list->tail_index--;
  list->element_count--;

  if (list->tail_index <= (int) (list->array_size * MIN_PCT_EL)) {
    list_resize(list, list->array_size * SHRINKING_FACTOR);
  }
}

void list_remove_i(List *list, int index) {
  if (list == NULL)
    throw_error("invalid parameter: list parameter cannot be NULL");
  if (index < 0 || index > list->element_count)
    throw_error("invalid parameter: invalid index value");

  list_left_shift(list, index);
  list->element_count -= 1;
}

void *list_get_i(List *list, int index) {
  if (list == NULL)
    throw_error("invalid parameter: list parameter cannot be NULL");
  if (index < 0 || index > list->element_count)
    throw_error("invalid parameter: invalid index value");

  return list->array_list[index];
}

Iterator *list_get_iterator(List *list) {
  if (list == NULL)
    throw_error("invalid parameter: list parameter cannot be NULL");
  Iterator *iterator = (Iterator *) malloc(sizeof(Iterator));
  iterator->index = 0;
  iterator->list = list;
  return iterator;
}

void iterator_next(Iterator *iterator) {
  if (iterator == NULL)
    throw_error("invalid parameter: iterator parameter cannot be NULL");
  iterator->index += 1;
}

int iterator_is_valid(Iterator *iterator) {
  if (iterator == NULL)
    throw_error("invalid parameter: iterator parameter cannot be NULL");
  return (iterator->index < iterator->list->element_count);
}

void *iterator_get_element(Iterator *iterator) {
  if (iterator == NULL)
    throw_error("invalid parameter: iterator parameter cannot be NULL");
  if (!iterator_is_valid(iterator))
    return NULL;

  return iterator->list->array_list[iterator->index];
}

void iterator_dispose(Iterator *iterator) {
  if (iterator == NULL)
    throw_error("invalid parameter: iterator parameter cannot be NULL");
  free(iterator);
}
