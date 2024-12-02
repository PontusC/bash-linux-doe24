#!/bin/bash

# Script lets user choose 3 times from a list, then exits.

NUM_OF_LOOPS=0

while true; do
# Get input
echo "Make a choice from below"
printf "one\ntwo\nthree\nfour\n"
echo -n "Enter choice, or 0 for exit: "
read choice

case $choice in
  one)
  echo "Chose: $choice"
  echo
  ;;
  two)
  echo "Chose: $choice"
  echo
  ;;
  three)
  echo "Chose: $choice"
  echo
  ;;
  four)
  echo "Chose: $choice"
  echo
  ;;
  0)
  break
  ;;
  *)
  echo "Invalid choice, try again"
  echo
esac

# Check if loop has run 3 or more times, if so exit
if ((NUM_OF_LOOPS >= 3));then
  echo "Three loops, exiting"
  break
else
  NUM_OF_LOOPS=$((NUM_OF_LOOPS+1))
fi
done