#!/bin/bash
# Script tests if leapyear and only 1 paramter is allowed to be given as input

if [ ! $# == 1 ]; then      # If number of inputs is not equal to 1 print error and exit 1
    echo "Wrong number of args. Should be 1, got $#"
    exit 1
fi

# Defines input
year=$1

if (( ("$year" % 400) == "0" )) || (( ("$year" % 4 == "0") && ("$year" % 100 != "0") ));
    then
    echo "leap year";
else
    echo "not leap";
fi