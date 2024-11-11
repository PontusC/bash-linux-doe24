#!/bin/bash
clear

echo "Below is path to home directory for user $USER"
echo "$HOME"		# Prints value of HOME variable, current users home directory
echo

echo "Currently using below terminal type"
echo "$TERM"		# TERM is variable indicating terminal type and capabilities of curr terminal
echo

echo "Below are all services in runlevel 3"
ls /etc/rc3.d/S*
