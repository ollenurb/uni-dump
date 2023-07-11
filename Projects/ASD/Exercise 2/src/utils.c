#include "utils.h"
#include <stdlib.h>

int min(int a, int b, int c) {
  int min = (a <= b && a <= c) ? a : (b <= a && b <= c) ? b : c;
  return min;
}

int **new_matrix(int m, int n) {
  int **return_val = (int **) malloc(sizeof(int *) * (unsigned long int) (m + 1));

  for (int i = 0; i <= m; i++)
    return_val[i] = (int *) malloc(sizeof(int) * (unsigned long int) (n + 1));

  // Initialize the matrix with -1 values
  for (int i = 0; i <= m; i++) {
    for (int j = 0; j <= n; j++)
      return_val[i][j] = -1;
  }
  return return_val;
}

void dispose_matrix(int **to_dispose, int size) {
  for (int i = 0; i <= size; i++)
    free(to_dispose[i]);
  free(to_dispose);
}
