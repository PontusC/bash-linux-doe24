#!/bin/bash
# SChecks if httpd and init daemons are running.
# Prints status of services, and if httpd is running special message

# Declare the two daemons/processes to find
daemonOne="sshd"        # Special case daemon (httpd in exercise)
daemonTwo="httpd"

# Selects all processes (-e) and gets all starting with ? (means running without terminal)
# Looks for matching process name at end of line
runningDaemons=$(ps -eo 'tty,pid,comm' | grep ^? | grep -E "($daemonOne|$daemonTwo)$")
# echo $runningDaemons

# Checks if given processes are found in previous search result 
if [[ $(echo $runningDaemons | grep -E "$daemonOne$") ]];then
    echo "$daemonOne is active"
    echo "Webserver running";
else
    echo "$daemonOne is inactive";
fi

if [[ $(echo $runningDaemons | grep -E "$daemonTwo$") ]];then
    echo "$daemonTwo is active";
else
    echo "$daemonOne is inactive";
fi