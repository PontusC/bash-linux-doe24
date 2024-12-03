#!/bin/bash

# This script displays prints and shifts input arguments. Descriptions at each step below.

# Print name of script
echo "Script being run: ${0##*/}"

# Print first, third and tenth argument
echo -e "arg1: $1\t\targ3: $3\t\targ10: ${10}"
# ${$X} is required when arg pos is greater than 1 digit, as else it interprets
# $10 as $1 and 0 as a string

# Print total number of arguments
echo "Number of args: $#"

# If more than 3 args, shift all args 3 left
if [ $# -gt 3 ];then
    echo "More than 3 args, shifting 3 steps"
    shift 3
fi

# Print all remaning args
echo "Remaning args: $@"

# Print remaining number of args
echo "Number of args: $#"