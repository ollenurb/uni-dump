#include <stdio.h>
#include <stdlib.h>
#include "unity.h"
#include "list.h"

static int i1, i2, i3;

List *array_list_int;
Iterator *list_iterator_int;

void setUp(void) {
  i1 = 0;
  i2 = -12;
  i3 = 954;
  array_list_int = list_create();
  list_iterator_int = list_get_iterator(array_list_int);
}

void tearDown(void) {
  list_dispose(array_list_int);
  iterator_dispose(list_iterator_int);
}

void test_list_is_empty_zero_el(void) {
  TEST_ASSERT_TRUE(list_is_empty(array_list_int));
}

void test_list_is_empty_one_el(void) {
  list_add_tail(array_list_int, &i2);
  TEST_ASSERT_FALSE(list_is_empty(array_list_int));
}

void test_list_size_zero(void) {
  TEST_ASSERT_EQUAL_INT(0, list_size(array_list_int));
}

void test_list_size_one(void) {
  list_add_tail(array_list_int, &i1);
  TEST_ASSERT_EQUAL_INT(1, list_size(array_list_int));
}

void test_list_size_three(void) {
  list_add_tail(array_list_int, &i1);
  list_add_tail(array_list_int, &i2);
  list_add_tail(array_list_int, &i3);
  TEST_ASSERT_EQUAL_INT(3, list_size(array_list_int));
}

void test_list_get_i(void) {
  int *ptr_arr[] = {&i1, &i2, &i3};
  list_add_tail(array_list_int, &i1);
  list_add_tail(array_list_int, &i2);
  list_add_tail(array_list_int, &i3);
  int **act_arr = malloc(2 * sizeof(int));
  for (int i = 0; i < 3; i++)
    act_arr[i] = (int *) list_get_i(array_list_int, i);

  TEST_ASSERT_EQUAL_PTR_ARRAY(ptr_arr, act_arr, 3);
}

void test_list_remove_tail(void) {
  int *ptr_arr[] = {&i1, &i2};
  list_add_tail(array_list_int, &i1);
  list_add_tail(array_list_int, &i2);
  list_add_tail(array_list_int, &i3);
  list_remove_tail(array_list_int);
  int **act_arr = malloc(2 * sizeof(int));
  for (int i = 0; i < 2; i++)
    act_arr[i] = (int *) list_get_i(array_list_int, i);

  TEST_ASSERT_EQUAL_PTR_ARRAY(ptr_arr, act_arr, 2);
}

void test_list_remove_i_first(void) {
  int *ptr_arr[] = {&i2, &i3};
  list_add_tail(array_list_int, &i1);
  list_add_tail(array_list_int, &i2);
  list_add_tail(array_list_int, &i3);
  list_remove_i(array_list_int, 0);
  int **act_arr = malloc(2 * sizeof(int));
  for (int i = 0; i < 2; i++)
    act_arr[i] = (int *) list_get_i(array_list_int, i);

  TEST_ASSERT_EQUAL_PTR_ARRAY(ptr_arr, act_arr, 2);
}

void test_list_remove_i_last(void) {
  int *ptr_arr[] = {&i1, &i2};
  list_add_tail(array_list_int, &i1);
  list_add_tail(array_list_int, &i2);
  list_add_tail(array_list_int, &i3);
  list_remove_i(array_list_int, 2);
  int **act_arr = malloc(2 * sizeof(int));
  for (int i = 0; i < 2; i++)
    act_arr[i] = (int *) list_get_i(array_list_int, i);

  TEST_ASSERT_EQUAL_PTR_ARRAY(ptr_arr, act_arr, 2);
}

void test_list_remove_i_mid(void) {
  int *ptr_arr[] = {&i1, &i3};
  list_add_tail(array_list_int, &i1);
  list_add_tail(array_list_int, &i2);
  list_add_tail(array_list_int, &i3);
  list_remove_i(array_list_int, 1);
  int **act_arr = malloc(2 * sizeof(int));
  for (int i = 0; i < 2; i++)
    act_arr[i] = (int *) list_get_i(array_list_int, i);

  TEST_ASSERT_EQUAL_PTR_ARRAY(ptr_arr, act_arr, 2);
}

void test_list_remove_i_all(void) {
  list_add_tail(array_list_int, &i1);
  list_add_tail(array_list_int, &i2);
  list_add_tail(array_list_int, &i3);

  for (int i = 2; i >= 0; i--) {
    list_remove_i(array_list_int, i);
  }


  TEST_ASSERT_EQUAL_INT(0, list_size(array_list_int));
}

void test_iterator_is_valid_true(void) {
  list_add_tail(array_list_int, &i1);
  TEST_ASSERT_TRUE(iterator_is_valid(list_iterator_int));
}

void test_iterator_is_valid_false(void) {
  TEST_ASSERT_FALSE(iterator_is_valid(list_iterator_int));
}

void test_iterator_get_first_element(void) {
  list_add_tail(array_list_int, &i1);
  TEST_ASSERT_EQUAL_PTR(&i1, iterator_get_element(list_iterator_int));
}

void test_iterator_get_invalid_element(void) {
  TEST_ASSERT_NULL(iterator_get_element(list_iterator_int));
}

int main(void) {
  UNITY_BEGIN();
  RUN_TEST(test_list_is_empty_zero_el);
  RUN_TEST(test_list_is_empty_one_el);
  RUN_TEST(test_list_size_zero);
  RUN_TEST(test_list_size_one);
  RUN_TEST(test_list_size_three);
  RUN_TEST(test_list_get_i);
  RUN_TEST(test_list_remove_tail);
  RUN_TEST(test_list_remove_i_first);
  RUN_TEST(test_list_remove_i_last);
  RUN_TEST(test_list_remove_i_all);
  RUN_TEST(test_iterator_is_valid_true);
  RUN_TEST(test_iterator_is_valid_false);
  RUN_TEST(test_iterator_get_first_element);
  RUN_TEST(test_iterator_get_invalid_element);
  return UNITY_END();
}
