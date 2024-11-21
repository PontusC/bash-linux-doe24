#!/usr/bin/awk -f
BEGIN {FS=":"}      # Sets separator to :
{printf "dn: uid=" $1 ", dc=example, dc=com\n"}
{printf "cn: " $2 " " $3 "\n"}
{printf "sn: " $3 "\n"}
{printf "telephoneNumber: " $4 "\n"}