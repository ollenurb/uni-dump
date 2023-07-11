#include "list.h"
#include <stdio.h>
#include <stdlib.h>

typedef struct _Node Node;

struct _Node {
  void *data;
  Node *next;
  Node *prev;
};

struct _List {
  Node *tail;
  Node *head;
  int element_count;
};

struct _Iterator {
  Node **current_node;
  List *list;
};

Node *node_new(void *, Node *, Node *);

void add_node_at(List *, Node *, void *);

void remove_node_at(List *, Node *);

void throw_error(char *string) {
  fprintf(stderr, "%s", string);
  exit(EXIT_FAILURE);
}

List *list_create() {
  List *new_list = (List *) malloc(sizeof(List));
  if (new_list == NULL)
    throw_error("malloc error: not enough space for a List object");

  new_list->tail = NULL;
  new_list->head = NULL;
  new_list->element_count = 0;
  return new_list;
}

void list_dispose(List *to_dispose) {
  if (to_dispose == NULL)
    throw_error("invalid parameter: to_dispose parameter cannot be NULL value");

  Node *disposable = to_dispose->head;
  Node *tmp;
  while (disposable != NULL) {
    tmp = disposable;
    disposable = disposable->next;
    free(tmp);
  }
  free(to_dispose);
}

void list_add_tail(List *list, void *element) {
  if (list == NULL)
    throw_error("invalid parameter: list parameter cannot be NULL");

  if (element == NULL)
    throw_error("invalid parameter: element parameter cannot be NULL");

  add_node_at(list, list->tail, element);
}

void list_add_i(List *list, void *element, int index) {
  if (list == NULL)
    throw_error("invalid parameter: list parameter cannot be NULL");
  if (element == NULL)
    throw_error("invalid parameter: element parameter cannot be NULL");
  if (index < 0 || index > list->element_count)
    throw_error("invalid parameter: invalid index value");

  Node *cursor = list->head;

  for (index -= 1; index > 0; index--)     // Search for the node position in which we have to place the new one
    cursor = cursor->next;

  add_node_at(list, cursor, element);
}

void list_print(List *list, void (print_element)(void *)) {
  Node *iterator = list->head;
  printf("\n");
  while (iterator) {
    print_element(iterator->data);
    iterator = iterator->next;
  }
}

int list_is_empty(List *list) {
  return (list->element_count == 0);
}

int list_size(List *list) {
  return list->element_count;
}

void list_remove_tail(List *list) {
  if (list == NULL)
    throw_error("invalid parameter: list parameter cannot be NULL");
  if (list->element_count == 0)
    throw_error("cannot remove an element from an empty list");

  remove_node_at(list, list->tail);
}

void list_remove_i(List *list, int index) {
  if (list == NULL)
    throw_error("invalid parameter: list parameter cannot be NULL");
  if (index < 0 || index >= list->element_count)
    throw_error("invalid parameter: invalid index value");
  if (list->element_count == 0)
    throw_error("cannot remove an element from an empty list");

  Node *cursor = list->head;

  for (; index > 0; index--)     // Search for the node position in which we have to remove the node
    cursor = cursor->next;

  remove_node_at(list, cursor);
}

void *list_get_i(List *list, int index) {
  if (index < 0 || index >= list->element_count) {
    printf("\nIndex:%d", index);
    throw_error("invalid index value");
  }


  Node *iterator = list->head;
  while (index) {
    iterator = iterator->next;
    index--;
  }
  return iterator->data;
}

Iterator *list_get_iterator(List *list) {
  if (list == NULL)
    throw_error("invalid parameter:  list parameter cannot be NULL");
  Iterator *new_iterator = (Iterator *) malloc(sizeof(Iterator));
  if (new_iterator == NULL)
    throw_error("malloc error: not enough space for an Iterator object");

  new_iterator->list = list;
  new_iterator->current_node = &list->head;
  return new_iterator;
}

void iterator_next(Iterator *iterator) {
  if (iterator == NULL)
    throw_error("invalid parameter: iterator parameter cannot be NULL");

  if (!iterator_is_valid(iterator))
    throw_error("invalid parameter: iterator parameter cannot be NULL");

  iterator->current_node = &((*iterator->current_node)->next);
}

int iterator_is_valid(Iterator *iterator) {
  if (iterator == NULL)
    throw_error("invalid parameter: iterator parameter cannot be NULL");

  return (*iterator->current_node != NULL);
}

void iterator_rewind(Iterator *iterator) {
  if (iterator == NULL)
    throw_error("invalid parameter: iterator parameter cannot be NULL");

  iterator->current_node = &(iterator->list->head);
}

void *iterator_get_element(Iterator *iterator) {
  if (iterator == NULL)
    throw_error("invalid parameter: iterator parameter cannot be NULL");
  if (!iterator_is_valid(iterator))
    return NULL;

  return (*iterator->current_node)->data;
}

void iterator_dispose(Iterator *iterator) {
  if (iterator == NULL)
    throw_error("invalid parameter: iterator parameter cannot be NULL");

  free(iterator);
}

Node *node_new(void *data, Node *next, Node *prev) {
  Node *new_node = (Node *) malloc(sizeof(Node));

  if (new_node == NULL)
    throw_error("malloc error: not enough space for a Node object");

  new_node->data = data;
  new_node->next = next;
  new_node->prev = prev;
  return new_node;
}

void add_node_at(List *list, Node *position, void *element) {
  /*
  ** There are 4 possible cases:
  **      - The list is empty, so we have to add the node that will become the tail and the head of the list
  **      - The position is the head, so we have to add the node that will become the new head of the list
  **      - The position is the tail, so we have to add the node that will become the new tail of the list
  **      - The position is neither the tail and the head, so that we have to add the node in the given position
  **/
  Node *new_node;
  if (list->element_count == 0) {
    list->head = list->tail = node_new(element, NULL, NULL);
  } else if (position == list->tail) {                                     // Add tail (update list tail)
    list->tail->next = node_new(element, NULL, list->tail);
    list->tail = list->tail->next;
  } else if (position == list->head) {                                     // Add head (update list head)
    list->head = node_new(element, list->head, NULL);
    list->head->next->prev = list->head;
  } else {
    new_node = node_new(element, position->next, position);           // Allocate the new node
    position->next->prev = new_node;
    position->next = new_node;
  }
  list->element_count += 1;
}

void remove_node_at(List *list, Node *position) {
  if (list->element_count == 1) {
    list->head = list->tail = NULL;
  } else if (position == list->tail) {                                            // remove tail (update list tail)
    list->tail = list->tail->prev;
    list->tail->next = NULL;
  } else if (position == list->head) {                                     // remove head (update list head)
    list->head = list->head->next;
    list->head->prev = NULL;
  } else {
    position->next->prev = position->prev;
    position->prev->next = position->next;
  }
  free(position);
  list->element_count -= 1;
}
