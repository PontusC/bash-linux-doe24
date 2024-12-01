#!/bin/bash

# This script takes one file as argument, and presents options on how to compress it using a here doc

FILE=$1

if [[ ! -f $FILE ]];then
    echo "Requires 1 file as input."
    exit 1
fi

echo "Compressing $FILE, please select which tool you would like to use."

# Prints the below list
cat << COMPRESS
gzip
bzip2
compress
zip
COMPRESS

echo -n "Choice: "
read choice

echo "Compressing $FILE utilizing $choice."