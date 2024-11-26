#!/bin/bash

# Script prints information about current month.
# Prints how many days in current month
# Prints information about leap years if current month is feb

# Retrieves relevant information
currentMonth=$(date +%m)    # month in number 1-12
currentYear=$(date +%Y)     # year in XXXX format

if (( $currentMonth == "1"));then
    echo "jan - 31 days";
elif (( currentMonth == "2"));then
    if (( ("$currentYear" % 400) == "0" )) || (( ("$currentYear" % 4 == "0") && ("$currentYear" % 100 != "0") ));then     # Check if leap year
        echo "feb - 30 days and leap year";
    else
        echo "feb - 29 days";
    fi
elif (( currentMonth == "3" ));then
    echo "nov";
elif (( currentMonth == "4" ));then
    echo "nov";
elif (( currentMonth == "5" ));then
    echo "nov";
elif (( currentMonth == "6" ));then
    echo "nov";
elif (( currentMonth == "7" ));then
    echo "nov";
elif (( currentMonth == "8" ));then
    echo "nov";
elif (( currentMonth == "9" ));then
    echo "nov";
elif (( currentMonth == "10" ));then
    echo "nov";
elif (( currentMonth == "11" ));then
    echo "nov";
elif (( currentMonth == "12" ));then
    echo "nov";
fi