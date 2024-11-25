#!/bin/bash

# Script prints information about current month.
# Prints how many days in current month
# Prints information about leap years if current month is feb

# Retrieves relevant information
currentMonth=$(date +%B)
maxDaysOfMonth=1

echo $currentMonth