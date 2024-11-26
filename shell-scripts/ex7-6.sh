#!/bin/bash
# Copies this exercise directory to remote machine using scp.
# Stores information in logfile under $LOG, requires it to be precreated? touch $LOG

SOURCE="~/dev/bash-linux-doe24"
TARGET="ubuntu-vm"
LOG=~/log/ex7-6.log

echo "Starting transfer from: $SOURCE -> $TARGET"

# Script captures all terminal output from given command (-c scp) and captures and stores it in the log. 
# -q removes some output from script, -a appends logfile, -e returns exit code of child
script -qaec "scp -r $SOURCE $TARGET:" $LOG

# Above returns error when you run it second time, i think due to it trying to copy directory structure and overwriting not allowed
# for that. Doesnt seem to return errors when overwriting file.

# $? holds exit codoe of the scp command ran, checks if succesful
if [ $? -eq 0 ] ;then
    echo "Transfer successful";
else
    echo "Transfer failed";
fi