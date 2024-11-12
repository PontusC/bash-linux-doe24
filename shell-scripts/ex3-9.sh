#!/bin/bash
clear

# This script can optionally take 2 integer parameters
# It will use these to calculate the surface area of a rectangle with sides given, or defaults 5 and 6

set +e                  # +e enables bash errexit, if any error in script occurs, it should stop

if [ -z "$1" ]; then    # -z "VAR" returns True if given variable is empty string
    VAR1="5"            # If script was ran with no given parameters, assign defaults
else
    VAR1=$1
fi
if [ -z "$2" ]; then
    VAR2="6"
else
    VAR2=$2
fi

echo "Script will calculate surface area of $VAR1 and $VAR2"
echo "Surface area for given values is: $((VAR1 * VAR2))"       # Performs arithmetic expansion
