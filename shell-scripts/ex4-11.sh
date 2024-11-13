#!/bin/bash
clear

# Script that checks for given or current logged in user in passwd file
# For exercise 4-11

set +e

if [ -z "$1" ]; then                                # Checks if empty input or not, defaults to current logged in user
    VAR1=$USER
else
    VAR1=$1
fi

echo "Checks if user: $VAR1 exists in /etc/passwd"
VAR2=$(grep "^$VAR1" /etc/passwd)                   # Finds a string in passwd that begins with given user

if [ -z "$VAR2" ]; then
    echo "User $VAR1 does not exist"
else
    echo "User $VAR1 exists"
fi
