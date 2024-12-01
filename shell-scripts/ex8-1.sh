#!/bin/bash
# This script asks for users age, if >16 prints can drink, else cannot. If >18 does (age-18)*100

# Get input
echo -n "What is your age?: "
read age

if [ $age -lt 16 ];then
    echo "You are not allowed to drink at age $age"
    exit;
else
    echo "You are allowed to drink at age $age"
    if [ $age -gt 17 ];then
        echo "Statistically you have drank $(( ($age - 18) * 100 )) liters of beer so far in your life"
    fi
    exit
fi