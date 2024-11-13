#!/bin/bash

# Script for exercises in chapter 4
# For descriptions on what code does, see /exercises-bash/exercises-4.md
clear

echo "Scripts for exercise 4-8"
echo
echo "4. Display localhost information"
grep -n localhost /etc/hosts
grep -o localhost /etc/hosts | echo "Occurences of localhost: $(wc -w)"
echo

echo "5. Display all subdirs in /usr/share/doc with shell anywhere in name"
find /usr/share/doc -name "*shell*" -type d
echo "-------------"

echo "6. Prints how many README files above subdirs contain"
echo "Number of occurences: $(find /usr/share/doc -name "*shell*" -type d -execdir find "{}" "-name" "README" ";" | wc -w)"
echo

echo "7. Files changed less than 10 hours ago"
ls -lAgG --time-style=+%s | grep -v "^d" | awk -vtenhours=$(date +%s -d "10 hours ago") '$4 > tenhours {print $5}'
echo
