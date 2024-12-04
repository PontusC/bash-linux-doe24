#!/bin/bash

# Writes iso file to given device. Does not interrupt while writing

if [ ! $# == 2 ];then
    echo -e "Usage requires 2 args\t1: source.iso\t2: device"
    exit 1
fi

SOURCE=$1
TARGET=$2

trap "echo Stopping now will corrupt device" SIGINT

echo "Starting transfer of $SOURCE to $TARGET"
# dd if="$SOURCE" of="$TARGEt" status=progress
echo "Complete"