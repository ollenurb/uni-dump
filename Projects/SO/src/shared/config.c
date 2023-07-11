#include <errno.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include "utils.h"
#include "config.h"

// Function declarations
struct var *cfgparse(FILE*);
FILE *gcf(char*);
void freevars(struct var *vars);

/* Struct that represents a variable (it has a name and a value) */
struct var {
	char *vnam;
	int val;
};

/* Returns a valid pointer to *fname file if exists */
FILE *gcf(char *fname) {
	FILE *fp;
	if((fp = fopen(fname, "r")) == NULL)
		throw_error("Fopen error");

        return fp;
}

/* Fills the 'cnfg' config data structure with the values of the
** configuration file.
*/
int get_conf(config *cnfg) {
	// Opens the config file, throws error if it doesn't exists
	FILE *fp = gcf(CF_NAM);
	struct var *vars = cfgparse(fp);

	for(int i = 0; i < N_VAR; i++) {
		char *tmp = vars[i].vnam;
		// For each var name, test if it is equals to every var name.
		// Throws error if it isn't equals to non of them
		if(strcmp("sim_time", tmp) == 0) {
			cnfg->sim_time = vars[i].val;
		} else if(strcmp("pct_n2", tmp) == 0) {
			cnfg->pct_n2 = vars[i].val;
		} else if(strcmp("pct_n3", tmp) == 0) {
			cnfg->pct_n3 = vars[i].val;
		} else if(strcmp("pct_n4", tmp) == 0) {
			cnfg->pct_n4 = vars[i].val;
		} else if(strcmp("nof_invites", tmp) == 0) {
			cnfg->nof_invites = vars[i].val;
		} else if(strcmp("max_reject", tmp) == 0) {
			cnfg->max_reject = vars[i].val;
		} else {
			errno = EINVAL;
			return -1;
		}
	}
        // Check if the probabilities are valid
        if((cnfg->pct_n2 + cnfg->pct_n3 + cnfg->pct_n4) != 100) {
                errno = EINVAL;
                return -1;
        }
	// Free memory
	freevars(vars);
	return 0;
}


/* Returns the address of an array of struct var with each element
** filled with the value parsed from the file that has been passed
** as parameter
*/
struct var *cfgparse(FILE *config_fp) {
	struct var *vars;
	int cnt = 0;
  	char line[BSIZE + 1]; // Current line that is being evaluated
    	char* token;
	// Allocate an array of type struct var of size N_VAR on memory (needed in order to return it)
	vars = malloc(sizeof(struct var) * N_VAR);
	// Read every line of the file
    	for(int i = 0; fgets(line, BSIZE, config_fp) != NULL; i++) {
		// Tokenize the string and get the first token (that represents var name)
		token = strtok(line, "\t =\n\r");
		// If the returned token is valid, then save it into the array and valuate the nex token to save it
        	if(token != NULL && token[0] != '#' && cnt <= N_VAR) {
			vars[cnt].vnam = strdup(token);
            		token = strtok(NULL, "\t =\n\r");
			vars[cnt].val = atoi(token);
			cnt++;
		}
	}
	return vars;
}

/* Free every pointer into every struct */
void freevars(struct var *vars) {
	for(int i = 0; i < N_VAR; i++)
		free(vars[i].vnam);

	free(vars);
}
