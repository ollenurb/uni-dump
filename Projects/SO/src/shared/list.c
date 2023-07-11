#include "list.h"
#include "utils.h"

/* Add a node into the linked list */
node *add(node *head, group toadd) {
        node *n_node = (node*) malloc(sizeof(node));

        if(n_node != NULL) {
                n_node->next = head;
                n_node->data = (group*) malloc(sizeof(group));
                group *n_group = n_node->data;
                /* Copy the values of the group into the created node */
                n_group->elements_count = toadd.elements_count;
                n_group->closed = toadd.closed;
                n_group->max_vote = toadd.max_vote;
                for(int i  = 0; i < 4; i++) n_group->members[i] = toadd.members[i];

        } else {
                throw_error("malloc returned a NULL pointer");
        }

        return n_node;
}


/* Free the list from the memory */
void dispose_l(node *start) {
        node *current = start;
        while(start != NULL) {
                start = start->next;
                free(current->data);
                free(current);
                current = start;
        }
}

/* Print the list */
void print_l(node *node) {
        while(node != NULL) {
                print_group(node->data);
                node = node->next;
        }
}

/* Print a specific group */
void print_group(group *cur_group) {
        printf("\n{");
        for(int i = 0; i < 4; i++)
                printf("%d, ", cur_group->members[i]);

        printf("%s }", (cur_group->closed == 0) ? "Open" : "Closed");
}

/* Returns a group if it's present, null otherwhise */
group* is_present(node *head, int matr) {
        group *c_group = NULL;
        node *c_node = head;

        while(c_node != NULL) {
                c_group = c_node->data;
                if(c_group->members[0] == matr)
                        return c_group;

                c_node = c_node->next;
        }
        return NULL;
}
