#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "list.h"
#include "list_merge.h"

void print_integer(void *element) {
  printf(" %d", *((int *) element));
}

int compare_integer(void *a, void *b) {
  return *((int *) a) <= *((int *) b);
}

int compare_string(void *a, void *b) {
  return strcmp((char *) a, (char *) b);
}

void print_string(void *element) {
  printf("%s", (char *) element);
}

void free_memory(List *to_free) {
  Iterator *iterator = list_get_iterator(to_free);
  void *data_to_free;
  while (iterator_is_valid(iterator)) {
    data_to_free = iterator_get_element(iterator);
    iterator_next(iterator);
    free(data_to_free);
  }
}

int main() {
  List *int_list_1 = list_create();
  List *int_list_2 = list_create();
  List *int_merged_list = NULL;


  int int_val1[] = {1, 5, 7, 9, 12, 17, 20, 22};
  int int_val2[] = {2, 3, 10, 17, 21, 50};
  int *ptr_int;

  // Fill the first list of integers
  for (int i = 0; i < 8; i++) {
    ptr_int = (int *) malloc(sizeof(int));
    *ptr_int = int_val1[i];
    list_add_tail(int_list_1, ptr_int);
  }

  // Fill the second list of integers
  for (int i = 0; i < 6; i++) {
    ptr_int = (int *) malloc(sizeof(int));
    *ptr_int = int_val2[i];
    list_add_tail(int_list_2, ptr_int);
  }

  // Merge the 2 integer lists
  int_merged_list = list_merge(int_list_1, int_list_2, compare_integer);

  printf("\n+==============================+ Integers Lists +==============================+\n\n");
  printf("\tList 1: \t");
  list_print(int_list_1, print_integer);
  printf("\n\tList 2: \t");
  list_print(int_list_2, print_integer);
  printf("\n\tMerged Lists: \t");
  list_print(int_merged_list, print_integer);
  printf("\n\n+==============================================================================+\n");

}
