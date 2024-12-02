#!/bin/bash

# This script takes a copy of files in /etc and places at designated target
# Probably just do a "cp -r $SOURC $TARGET" instead of loop

SOURCE=/etc
TARGET=/home/pc/tests
NUM=0

echo "Copying from $SOURCE to $TARGET"

for i in $(find $SOURCE -type f);do
  cp -u "$i" "$TARGET$i"
  NUM=$((NUM+1))
  break
done

echo "Finished copying a total of $NUM files"