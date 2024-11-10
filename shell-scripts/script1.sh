#!/bin/bash
clear 			# Comment for commenting

printf "Hi $USER\nI will now print a list of connected users:\n"
w
echo

echo "Setting two variables"
COLOUR="black"
VALUE="9"
printf "This is a string: $COLOUR\nThis is a number: $VALUE\n"

echo "Exiting"
