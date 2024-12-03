#!/bin/bash

# This script converts all file names containing upper case characters into file# names containing only lower cases.

LIST="$(ls)"

for name in $LIST; do
    if [[ "$name" != *[[:upper:]]* ]]; then
        continue
    fi

    ORIG="$name"
    NEW=`echo $name | tr 'A-Z' 'a-z'`

    # Get file extension and base file name
    EXTENSION="${NEW##*.}"
    FILENAME="${NEW%.*}"
    APPEND=0

    # Keep appending an increasing number until that file doesnt exist
    until [ ! -f $NEW ];do
        APPEND=$((APPEND+1))
        # If file has no extension, extension and filename are equal
        # Dont want to append extension in that case (test would become test-test)
        if [[ "$FILENAME" == "$EXTENSION" ]];then
            NEW="$FILENAME-$APPEND"
        else
            NEW="$FILENAME-$APPEND.$EXTENSION"
        fi
    done

    mv "$ORIG" "$NEW"
    echo "new name for $ORIG is $NEW"
done