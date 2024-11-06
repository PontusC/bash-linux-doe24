#!/bin/bash
clear
printf "Program start\n"

printf "User: $USER\n"

printf "Today's date: `date`, week: `date +"%V"`\n"

printf "Users logged in:"
w | cut -d " " -f 1 - | grep -v USER | sort -u
echo

printf "This is `uname -s` running on `uname -m`cpu\n"
printf "Uptime:"
uptime
echo
printf "End"
