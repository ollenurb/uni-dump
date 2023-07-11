#ifndef _CONFIG_H
#define _CONFIG_H

#define CF_NAM "../config/opt.conf"		/* Name (and path) of the configuration file */
#define BSIZE 250				/* Maximum number of character per-line */
#define N_VAR 6 				/* Number of variables into the config file */

typedef struct my_conf {			/* A representation of the data contained into the configuration file */
	int sim_time;
	int pct_n2;
	int pct_n3;
	int pct_n4;
	int nof_invites;
	int max_reject;
} config;

int get_conf(config *cnfg);			/* A function that assigns the values contained into opt.conf into the cnfg data structure */

#endif
