#!/bin/bash

# Script lets user choose 3 times from a list, then exits.

NUM_OF_LOOPS=0

while ((NUM_OF_LOOPS < 3)); do
  # Get input
  echo "Make a choice from below"
  printf "one\ntwo\nthree\nfour\n"
  echo -n "Enter choice, or 0 for exit: "
  read choice

  case $choice in
    one)
    # All these case statements could be a function
    echo "Chose: $choice"
    NUM_OF_LOOPS=$((NUM_OF_LOOPS+1))
    echo
    ;;
    two)
    echo "Chose: $choice"
    NUM_OF_LOOPS=$((NUM_OF_LOOPS+1))
    echo
    ;;
    three)
    echo "Chose: $choice"
    NUM_OF_LOOPS=$((NUM_OF_LOOPS+1))
    echo
    ;;
    four)
    echo "Chose: $choice"
    NUM_OF_LOOPS=$((NUM_OF_LOOPS+1))
    echo
    ;;
    0)
    break
    ;;
    *)
    echo "Invalid choice, try again"
    echo
  esac
done

echo "Three loops completed, exiting"