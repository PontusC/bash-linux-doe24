#!/bin/bash

# This script prints all lines containg trailing whitespace in a file

FILENAME=$1                     # First parameter is file to check

echo "prints all lines in \"$1\" containing trailing whitespace"
echo "  line  match"
cat -n $1 | sed -n -E '/.*\s+$/p'       # Matches 0 or more anything (.*) with 1 or more any whitespace (\s+) before end of line ($)