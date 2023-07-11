/*
** The header file that contains the description of the module that implements a linked list data structure
** Linked list nodes are generic, which means that they can be of any type specified in declaration
*/
#ifndef LIST_H
#define LIST_H

#include <stdio.h>
#include <stdlib.h>
#include "utils.h"

struct node {
        group *data;
        struct node *next;
};

typedef struct node node;

node *add(node *head, group element);
void dispose_l(node *start);
void print_l(node *node);
group* is_present(node *node, int matr);            // Returns NULL if the matr isn't present into any group, the reference of the group if present
void print_group(group *);

#endif
