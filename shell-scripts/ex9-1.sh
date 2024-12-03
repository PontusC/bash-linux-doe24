#!/bin/bash

# This script takes a copy of files in /etc and places at designated target
# Probably just do a "cp -r $SOURCE $TARGET" instead of loop

SOURCE=/etc
TARGET=/home/pc/tests
NUM=0

echo "Copying from $SOURCE to $TARGET"

# Find gets all files including path from etc.
for i in $(find $SOURCE -type f);do
  cp --parents -u "$i" "$TARGET"    # Copies files incudling their path (parents flag), -u updates files at location
  NUM=$((NUM+1))
done

echo "Finished copying a total of $NUM files"