#!/bin/sh
green=`tput setaf 2`
reset=`tput sgr0`
bold=`tput bold`
bell=`tput bel`
cols=`tput cols` # Get the current terminal width


# Clean older files and compile, exit if there is an error
rm -rf ./out/* || true;
mkdir -p ./out/;
cd src;
javac -d ../out/ ./kruskalAlgorithmUsage/*.java -Xlint || exit;
javac -d ../out/ -cp ".:/graph.*:/usr/share/java/junit4.jar:/usr/share/java/hamcrest-core-1.3.jar:" ./test/*.java || exit;

# Print - till the end of line
echo "${bell}"
i=0
while [ $i -lt $cols ]; do echo -n "-"; i=`expr $i + 1`; done; echo
# Print a system message
echo "${bold}Files has been compiled successfully.${reset}"
echo "Move to ${green}./out${reset} to execute them"

# Print - till the end of line
i=0
while [ $i -lt $cols ]; do echo -n "-"; i=`expr $i + 1`; done; echo
