#!/bin/bash

# This script backs up and compresses users home directory

# Locations to use
SOURCE="/home/$USER/test-data"
TARGET="/home/$USER/backups"

# Tests number of args
if [ ! $# == 0 ];then
    echo "Usage: $0."
    exit 1
fi

# Get free space available on partition used by TARGET, and estimate space used by backup
FREE_SPACE=$(df $TARGET | grep -v Filesystem | awk '{print $4}')
# Halves the estimated usage of users home folder, to estimate space used after compression
USED_SPACE=$(du -c $SOURCE | grep total | cut -f 1)
ESTIMATED_SPACE=$(( $USED_SPACE / 2))

# Check if space is available
if [ $FREE_SPACE -lt $ESTIMATED_SPACE ];then
    echo -e "Not enough available space. Free: $(numfmt --to=iec $FREE_SPACE)\t\
    Estimated usage: $(numfmt --to=iec $ESTIMATED_SPACE)."
    exit 1
fi

# Get input regarding full or incremental backup
echo -n "Would you like a [f]ull or [i]ncremental backup? [f,i]: "
read -n 1 CHOICE
echo

# Check if full backup exists
BACKUP="$TARGET/homebackup-level0.tar.gz"
SNAPSHOT_FILE="$TARGET/homebackup.snar"

if [[ $CHOICE == "f" ]];then      # Choice to generate full backup
    echo "Generating full backup."
    # Make sure tar args end with "f" if using it as arg, else error
    tar -cvpzf $BACKUP -g $SNAPSHOT_FILE $SOURCE
    echo "Generated full backup at $BACKUP of size $(du -b $BACKUP | cut -f 1)."
    exit 0
elif [[ ! -f $BACKUP ]];then
    echo "No full backup exists, generating."
    tar -cvpzf $BACKUP -g $SNAPSHOT_FILE $SOURCE
    echo "Generated full backup at $BACKUP of size $(du -b $BACKUP | cut -f 1)."
    exit 0
fi

## Below are all choices for incremental backup
# Checks if backup was modified less than a week ago
WEEK_IN_SECONDS=604800
CURRENT_TIME=$(date +%s)
LAST_UPDATED=$(date -r $BACKUP +%s)

# True if more than a week old backup
if [ $(($CURRENT_TIME - $WEEK_IN_SECONDS)) -gt $LAST_UPDATED ];then
    echo "Backup is more than a week old, you should take a full one"
    echo "Nothing generated"
    exit 0
fi

# Generate incremental backup
BACKUP="$TARGET/incremental.$(date +%s).tar.gz"

echo "Generating incremental backup"
tar -cvpzf $BACKUP -g $SNAPSHOT_FILE $SOURCE
echo "Generated incremental backup at $BACKUP of size $(du -b $BACKUP | cut -f 1)."