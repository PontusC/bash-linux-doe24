#!/bin/bash

# Prints status of services

# Presents the choices to user
echo "Make a choice of daemon to check"
cat << choices
upower
ssh
docker 
choices
echo -n "Choice: "
read choice

# only char given as input
if [[ "$choice" == [a-z] ]];then
    echo "Only 1 char as input"
    exit
fi

# Selects all processes (-e) and gets all starting with ? (means running without terminal)
# Looks for matching process name at end of line
runningDaemons=$(ps -eo 'tty,pid,comm' | grep ^? | grep -E $choice | awk '{printf "%s\t%s\n",$2,$3}')

# Checks if given processes are found in previous search result 
if [[ $(echo $runningDaemons | grep -E "$choice") ]];then
    echo "$choice is active with below processes:"
    echo "$runningDaemons"
else
    echo "$choice is inactive";
    exit
fi
