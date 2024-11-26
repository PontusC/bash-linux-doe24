#!/bin/bash
# This script does a very simple test for checking disk space.

# Creates a .tar -> .zip and stores it in /tmp/
# If backup already exists delete it first

SOURCE=~/dev/bash-linux-doe24
TARGET=/tmp/ex7-7.tar.gz

# Check if file exists
if [ -e $TARGET ];then
    rm $TARGET;
    echo "Compressed archive found, deleting"
    if [ $? -eq 0 ] ;then   # Check if rm ran succesfully
        echo "Successfully deleted $TARGET";
    else
        echo "Deletion failed";
        exit 1
    fi
fi

echo "Compressing $SOURCE and storing under $TARGET"
tar czf $TARGET $SOURCE



space=`df -h | awk '{print $5}' | grep -v Use | sort -n | tail -1 | cut -d "%" -f1`

case $space in
    [1-9])      # <10%
        Message="Lower than 10%"
        ;;
    [1-6]*)     # 10% ≤ space < 70
        Message="All is quiet."
        ;;
    [7-8]*)     # 70% ≤ space < 90
        Message="Start thinking about cleaning out some stuff.  There's a partition that is $space % full."
        ;;
    90)
        Message="Exactly $space"
        ;;
    9[1-8])     # 90% ≤ space < 99
        Message="Better hurry with that new disk...  One partition is $space % full."
        ;;
    99)         # 99% ≤ space
        Message="I'm drowning here!  There's a partition at $space %!"
        ;;
    *)
        Message="I seem to be running with an nonexistent amount of disk space..."
        ;;
esac

echo $Message