#!/bin/bash

# This script takes a copy of files in /etc and places at designated target
# Probably just do a "cp -r $SOURC $TARGET" instead of loop

# Check input
if [ ! $# == 1 ];then
  echo "Wrong input"
  exit 1
elif [ ! -d "$1" ];then   # Check if dir
  echo "Input is not directory"
  exit 1
fi

echo "Five largest files in: $1"
ls -lhS "$1" | grep -v -E total.*[0-9]*$ | head -5 | awk 'BEGIN{printf "File\t\t\tSize\n"} {printf "%s\t\t%s\n",$9,$5}'

echo
echo "Five most recently modified files in: $1"
find "$1" -type f -printf '%Cs:%f\n' | sort -nr | head -5 | awk -F: '{print $2}'