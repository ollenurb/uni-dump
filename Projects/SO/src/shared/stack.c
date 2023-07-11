#include "stack.h"

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int nodds(student *);

/* Allocates stack in memory and returns it */
stack *stack_init(int max_sz) {
        stack *cur;
        cur = malloc(sizeof(stack));

        cur->contents = malloc(sizeof(student*) * max_sz);

        if(cur->contents == NULL) {
                return NULL;
        }

        cur->max_sz = max_sz;
        cur->tos = -1;

        return cur;
}

/* Free the memory allocated for cur stack */
void stack_dispose(stack *cur) {
        free(cur->contents);
        free(cur);
}

/* Returns true if empty, false otherwhise */
int stack_empty(stack *cur) {
        return cur->tos < 0;
}

/* Returns true if full, false otherwhise */
int stack_full(stack *cur) {
        return cur->tos >= cur->max_sz - 1;
}

/* Push an element into the stack */
void stack_push(stack *cur, student *elm) {
        if(stack_full(cur))
                throw_error("stack is full");

        cur->contents[++cur->tos] = elm;
}

/* Pop the first element on top of the stack */
student* stack_pop(stack *cur) {
        if(stack_empty(cur))
                throw_error("stack is empty");

        cur->tos = ((cur->tos) % cur->max_sz);

        return cur->contents[cur->tos++];
}

/* Print the stack by vote */
void stack_print(stack *cur) {
        printf("\n[%d]: ", pidtomat(getpid()));
        for(int i = 0; i < cur->tos + 1; i++)
                printf("%d -> ", cur->contents[i]->vote);
}

/* Sort the contents of the stack by vote */
void stack_sort(stack *cur) {
        int key, j;
        for (int i = 1; i < cur->tos + 1; i++) {
                key = cur->contents[i]->vote;
                j = i - 1;

                while (j >= 0 && cur->contents[j]->vote > key) {
                        cur->contents[j+1]->vote = cur->contents[j]->vote;
                        j = j-1;
                }
        cur->contents[j+1]->vote = key;
        }
}

/* Create a stack with only even elements of studs */
stack *stack_evens(student *studs) {
	int size = POP_SIZE - nodds(studs);
	int j = 0;
	int i = 0;
	stack *res = stack_init(size - 1);
	student *cur;
        int matr = pidtomat(getpid());

	if(res == NULL)
		throw_error("malloc error");

	for(cur = studs, i = 0; i < POP_SIZE; i++, cur = (studs + i)) {
		if((!(((studs + i)->matr) & 1)) && ((studs + i)->matr != matr)) { // Current number is odd, copy it then
			stack_push(res, cur);
			j++;
		}
	}

	return res;
}

/* Create a stack with only odd elements of studs */
stack *stack_odds(student *studs) {
	int size = nodds(studs);
	int j = 0;
	int i = 0;
	stack *res = stack_init(size - 1);
	student *cur;
        int matr = pidtomat(getpid());

	if(res == NULL)
		throw_error("malloc error");

	for(cur = studs, i = 0; i < POP_SIZE; i++, cur = (studs + i)) {
		if(((cur->matr) & 1) && (cur->matr != matr)) { // Current number is odd, copy it then
			stack_push(res, cur);
			j++;
		}
	}

	return res;
}

/* Returns the number of odd matr elements */
int nodds(student *slist) {
	int val = 0;
	for(int i = 0; i < POP_SIZE; i++)
		if((slist + i)->matr & 1) val++;

	return val;
}
