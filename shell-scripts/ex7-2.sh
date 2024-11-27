#!/bin/bash

# Script prints information about current month.
# Prints how many days in current month
# Prints information about leap years if current month is feb

# Retrieves relevant information
currentMonth=$(date +%m)    # month in number 1-12
currentYear=$(date +%Y)     # year in XXXX format

case $currentMonth in
    1|3|5|7|8|10|12)
        echo "$(date +%B) - 31 days"
        ;;
    4|6|9|11)
        echo "$(date +%B) - 30 days"
        ;;
    2)
        if (( ("$currentYear" % 400) == "0" )) || (( ("$currentYear" % 4 == "0") && ("$currentYear" % 100 != "0") ));then     # Check if leap year
            echo "feb - 29 days and leap year";
        else
            echo "feb - 28 days";
        fi
        ;;
esac
