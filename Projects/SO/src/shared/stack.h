#ifndef STACK_H
#define STACK_H

#include "utils.h"

typedef struct stack {
        int max_sz;
        int tos;
        student **contents;
} stack;

stack *stack_init(int);                                         // Returns a new stack with given size
void stack_dispose(stack*);                                     // Dispose from memory the given stack address
student* stack_pop(stack*);                                     // Pop from the given stack an element
void stack_push(stack*, student*);                              // Push to the given stack the fiven student
int stack_full(stack*);                                         // Return 1 if stack is full, 0 otherwhise
int stack_empty(stack*);                                        // Return 1 if stack is empty, 0 otherwise
void stack_print(stack*);                                       // Prints the given stack
void stack_sort(stack*);                                        // Sort the stack
stack *stack_evens(student*);                                   // Create a stack of evens matr
stack *stack_odds(student*);                                    // Create a stack of odds matr

#endif
