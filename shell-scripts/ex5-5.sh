#!/bin/bash

# Script takes 1 parameter (file to operate on) where it will delete first 3 lines and
# then print all lines that match the pattern "an"

FILENAME=$1                               # First parameter is filename given
TMPFILE=/tmp/$FILENAME-modified

sed '1,3d' $FILENAME > $TMPFILE
echo "Deleted first 3 lines and stored result in $TMPFILE"

echo "These are all lines in '$TMPFILE' containg pattern 'an'"
sed -n '/an/p' $TMPFILE


echo "These are all lines in '$TMPFILE' containg pattern 'man'"
#sed -n '/man/i *Inserted before man match*' $TMPFILE 

sed -n '/man/i \*match*' $TMPFILE 
