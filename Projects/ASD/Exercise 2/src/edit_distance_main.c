#include "edit_distance.h"
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {

  if (argc < 3) {
    printf("Usage: edit_distance <string1> <string2>\n");
    exit(EXIT_FAILURE);
  }

  printf("\nDynamic Programming: %d", edit_distance_dyn(argv[1], argv[2]));
  printf("\nRecursive Function: %d", edit_distance(argv[1], argv[2]));
}
