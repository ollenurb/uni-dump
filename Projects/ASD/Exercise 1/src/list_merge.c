#include "list_merge.h"

List *list_merge(List *first, List *second, int (compare)(void *, void *)) {
  List *new_list = list_create();
  int i = 0, j = 0;
  int f_siz = list_size(first), s_siz = list_size(second);
  void *first_elem, *second_elem;

  while (i < f_siz && j < s_siz) {
    first_elem = list_get_i(first, i);
    second_elem = list_get_i(second, j);

    if (compare(first_elem, second_elem)) {
      list_add_tail(new_list, first_elem);
      i++;
    } else {
      list_add_tail(new_list, second_elem);
      j++;
    }
  }

  while (i < f_siz) {
    first_elem = list_get_i(first, i);
    list_add_tail(new_list, first_elem);
    i++;
  }

  while (j < s_siz) {
    second_elem = list_get_i(second, j);
    list_add_tail(new_list, second_elem);
    j++;
  }

  return new_list;
}
