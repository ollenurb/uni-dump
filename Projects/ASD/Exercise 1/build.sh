#!/bin/sh
green=`tput setaf 2`
reset=`tput sgr0`
bold=`tput bold`
bell=`tput bel`
cols=`tput cols` # Get the current terminal width
i=0
# Print - till the end of line
while [ $i -lt $cols ]; do echo -n "-"; i=`expr $i + 1`; done; echo
# Clean older files and compile, exit if there is an error
mkdir -p ./bin ./obj
make clean || true;
make all || exit;
# Print - till the end of line
i=0
while [ $i -lt $cols ]; do echo -n "-"; i=`expr $i + 1`; done; echo
# Print a system message
echo "${bell}"
echo "${bold}Files has been compiled successfully.${reset}"
echo "Move to ${green}./bin${reset} to execute them"
