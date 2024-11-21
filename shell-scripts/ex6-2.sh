#!/bin/bash

# Prints top three users of disk space in /home

TMPFILE="/tmp/tmp_ex6-2"

# Stores information in format size:userid per file under /home
find /home -type f -printf "%s:%U\n" > $TMPFILE

# Iterates over previous result and sums up disk usage in format totalsize:userid
# Sorts descending by totalsize and only prints top 3 
# $2 = USERID, $1 = DISKUSAGE
awk -F: '{diskusage[$2]+=$1} END{for (i in diskusage) printf "%s\t%s\n",diskusage[i],i}' $TMPFILE |
sort -n -r | head -3 | numfmt --to=iec | awk 'BEGIN{printf "Size\t\tUserID\n"} {printf "%s\t\t%s\n",$1,$2}'