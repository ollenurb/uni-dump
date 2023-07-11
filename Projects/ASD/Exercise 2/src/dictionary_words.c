#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <time.h>
#include "list.h"
#include "edit_distance.h"
#include <time.h>

#define OFFSET 2
#define BUFFER_SIZE 256

/*
** Returns the minimum value between 2 integers
** @param int: The first value
** @param int: The second value
** @return: The maximum value betweeen the first and second value
*/
int min2(int, int);

/*
** Append a new character a the end of a given string
** @param char*: String on which the new character will be appended
** @param char: Character that will be appended to the string
** @return: 1 opon success, -1 otherwhise
*/
int buffer_append(char *, char);

/*
** Load correctme strings on a List
** @param char*: String that represents the correctme filepath
** @return: The pointer of the List containing correctme words
*/
List *get_correctme_words(char *);

/*
** Load dictionary strings on a List
** @param char*: String that represents the dictionary filepath
** @return: The pointer of the List containing dictionary words
*/
List *get_dictionary_words(char *);

/*
** Deallocate the string list
** @param List*: The string List to deallocate from the memory
*/
void free_string_list(List *);

/*
** Find and return the minimum edit distance value given a string and a dictionary list
** @param char*: The pointer to the string that will be used to search the minimum
** @param List*: The list on which the dictionary has been previously loaded
** @return: The minimum edit distance in dictionary
*/
int minimum_ed(char *, List *);

/*
** Prints each word from correctme and their minimum ed words from the dictionary
** @param List*: The List on which correctme words has been previously loaded
** @param List*: The List on which the dictionary words has been previously loaded
*/
void print_words_dic_list(List *, List *);


int main(int argc, char *argv[]) {
  setbuf(stdout, NULL);

  if (argc < 3) {
    printf("Usage: edit_distance <correctme_path> <dictionary_path>\n");
    exit(EXIT_FAILURE);
  }
  clock_t start, end;
  start = clock();

  printf("\nLoading %s file...", argv[1]);
  List *correctme_words = get_correctme_words(argv[1]);
  printf("\nThe file has been successfully loaded into the memory.");
  printf("\nLoading %s file...", argv[2]);
  List *dictionary_words = get_dictionary_words(argv[2]);
  printf("\nThe file has been successfully loaded into the memory.");
  printf("\n\n+===========================+ Dictionary Words +===========================+");

  print_words_dic_list(correctme_words, dictionary_words);

  free_string_list(correctme_words);
  free_string_list(dictionary_words);
  end = clock();
  printf("\n+==========================================================================+");
  printf("\n\tThe program took %f seconds to complete its job.", ((double) (end - start)) / CLOCKS_PER_SEC);
  printf("\n+==========================================================================+");
  return 0;
}

int buffer_append(char *string, char c) {
  int length = (int) strlen(string);

  if (length + 1 >= BUFFER_SIZE)
    return -1;

  string[length] = c;
  return 1;
}

List *get_correctme_words(char *filepath) {
  char c;
  char word_buffer[BUFFER_SIZE];
  List *word_list = list_create();
  FILE *fp = fopen(filepath, "r");

  if (fp == NULL) {
    printf("\nError: fopen() returned an invalid pointer value");
    exit(EXIT_FAILURE);
  }

  memset(word_buffer, 0, sizeof(word_buffer));

  while ((c = (char) fgetc(fp)) != EOF) {
    if ((c >= 65 && c <= 90) || (c >= 97 && c <= 122)) {
      if (buffer_append(word_buffer, c) == -1) {printf("\n\n+==========================================================================+\n\n");
        printf("\nError: buffer_append() returned an error value");
        exit(EXIT_FAILURE);
      }
    } else if (c == ' ' || c == '\n') {
      list_add_tail(word_list, strdup(word_buffer));     // Create a new string and save it to the words_array
      memset(word_buffer, 0, sizeof(word_buffer));       // Empty word_buffer
    }
  }
  fclose(fp);

  return word_list;
}

List *get_dictionary_words(char *filepath) {
  assert(filepath != NULL);
  FILE *fp = fopen(filepath, "r");
  char word_buffer[BUFFER_SIZE];
  List *dic_words = list_create();

  if (fp == NULL) {
    printf("\nError: fopen() returned an invalid pointer value");
    exit(EXIT_FAILURE);
  }

  while (fgets(word_buffer, sizeof(word_buffer), fp) != NULL) {
    word_buffer[strcspn(word_buffer, "\n")] = '\0';        // Get rid of the newline character
    list_add_tail(dic_words, strdup(word_buffer));
  }

  fclose(fp);

  return dic_words;
}

int minimum_ed(char *string, List *dictionary) {
  assert(string != NULL && dictionary != NULL);
  int string_length = (int) strlen(string);
  char *current_dict_word = NULL;
  Iterator *dictionary_iterator = list_get_iterator(dictionary);
  int min_value = edit_distance_dyn(string, iterator_get_element(dictionary_iterator));

  while (iterator_is_valid(dictionary_iterator) && min_value != 0) {
    current_dict_word = (char *) iterator_get_element(dictionary_iterator);
    if ((int) strlen(current_dict_word) <= string_length + OFFSET && (int) strlen(current_dict_word) >= string_length - OFFSET) {
      min_value = min2(min_value,
                       edit_distance_dyn(string, iterator_get_element(dictionary_iterator)));
    }
    iterator_next(dictionary_iterator);
  }

  iterator_dispose(dictionary_iterator);
  return min_value;
}

int min2(int a, int b) {
  return (a < b) ? a : b;
}

void print_words_dic_list(List *correctme, List *dictionary) {
  Iterator *correctme_iterator = list_get_iterator(correctme);
  Iterator *dictionary_iterator =  list_get_iterator(dictionary);
  char *current_word;
  int min_ed;

  while (iterator_is_valid(correctme_iterator)) {
    current_word = (char *) iterator_get_element(correctme_iterator);
    min_ed = minimum_ed(current_word, dictionary);

    printf("\n\n%s:", current_word);

    while (iterator_is_valid(dictionary_iterator)) {
      if (edit_distance_dyn(current_word, iterator_get_element(dictionary_iterator)) == min_ed) {
        printf("\n%s", (char *) iterator_get_element(dictionary_iterator));
      }
      iterator_next(dictionary_iterator);
    }
    iterator_rewind(dictionary_iterator);
    iterator_next(correctme_iterator);
  }
  iterator_dispose(correctme_iterator);
  iterator_dispose(dictionary_iterator);
}

void free_string_list(List *string_list) {
  Iterator *iterator = list_get_iterator(string_list);
  while (iterator_is_valid(iterator)) {
    free(iterator_get_element(iterator));
    iterator_next(iterator);
  }
  list_dispose(string_list);
  iterator_dispose(iterator);
}
