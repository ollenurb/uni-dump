#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "unity.h"
#include "utils.h"
#include "edit_distance.h"

static char *string;
static int i1, i2, i3;

void setUp() {
  i1 = 18;
  i2 = -9;
  i3 = 5;
  string = strdup("algoritmo");
}

void tearDown() {
  free(string);
}

static void test_min_equal_min_element() {
  TEST_ASSERT_EQUAL_INT(-9, min(i1, i2, i3));
}

static void test_edit_distance_equal_zero() {
  TEST_ASSERT_EQUAL_INT(0, edit_distance(string, "algoritmo"));
}

static void test_edit_distance_equal_one() {
  TEST_ASSERT_EQUAL_INT(1, edit_distance(string, "algoritm"));
}

static void test_edit_distance_equal_strlen() {
  TEST_ASSERT_EQUAL_INT(9, edit_distance(string, "vvvvvvvvv"));
}

static void test_edit_distance_dyn_equal_zero() {
  TEST_ASSERT_EQUAL_INT(0, edit_distance_dyn(string, "algoritmo"));
}

static void test_edit_distance_dyn_equal_one() {
  TEST_ASSERT_EQUAL_INT(1, edit_distance_dyn(string, "algoritm"));
}

static void test_edit_distance_dyn_equal_strlen() {
  TEST_ASSERT_EQUAL_INT(9, edit_distance_dyn(string, "vvvvvvvvv"));
}

static void test_edit_distance_dyn_equal_edit_distance() {
  TEST_ASSERT_EQUAL_INT(edit_distance(string, "laboratorio"), edit_distance_dyn("laboratorio", string));
}

int main() {
  UNITY_BEGIN();
  RUN_TEST(test_min_equal_min_element);
  RUN_TEST(test_edit_distance_equal_zero);
  RUN_TEST(test_edit_distance_equal_one);
  RUN_TEST(test_edit_distance_equal_strlen);
  RUN_TEST(test_edit_distance_dyn_equal_zero);
  RUN_TEST(test_edit_distance_dyn_equal_one);
  RUN_TEST(test_edit_distance_dyn_equal_strlen);
  RUN_TEST(test_edit_distance_dyn_equal_edit_distance);
  return UNITY_END();
}
