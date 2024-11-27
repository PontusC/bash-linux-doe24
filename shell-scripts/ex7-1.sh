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
        echo "feb - 29 days and leap year";
    else
        echo "feb - 30 days";
    fi
elif (( currentMonth == "3" ));then
    echo "march - 31 days";
elif (( currentMonth == "4" ));then
    echo "april - 30 days";
elif (( currentMonth == "5" ));then
    echo "may - 31 days";
elif (( currentMonth == "6" ));then
    echo "june - 30 days";
elif (( currentMonth == "7" ));then
    echo "july - 31 days";
elif (( currentMonth == "8" ));then
    echo "august - 31 days";
elif (( currentMonth == "9" ));then
    echo "september - 30 days";
elif (( currentMonth == "10" ));then
    echo "october - 31 days";
elif (( currentMonth == "11" ));then
    echo "november - 30 days";
elif (( currentMonth == "12" ));then
    echo "december - 31 days";
fi
