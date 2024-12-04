#!/bin/bash

# Add function to "print" man pages
printman (){
    # Check input for usage
    if [ $# == 0 ];then
        echo "Requires 1 arg (command to manpage print), optionally a 2nd arg of specified page"
        return 1
    fi

    # Check if 2 or 1 args (for page specified)
    if [ $# == 2 ];then
        ARGS="$1.$2"
    else
        ARGS="$1"
    fi

    CONTENT=$(man -P cat "$ARGS")
    [ $? -eq 0 ] && echo "$CONTENT" # Only print content if man page succeeded, else prints emtpy row
}