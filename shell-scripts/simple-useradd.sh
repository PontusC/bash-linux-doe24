#!/bin/bash
# Script takes one argument (new username) and adds a local user to the system

# Tests number of args
if [ ! $# == 1 ];then
    echo "Usage: $0."
    echo "Requires one arg which should be username for new user"
    exit 1
fi

# Variables
PASSWD=/etc/passwd
GRP=/etc/group
SHDW=/etc/shadow
USERNAME=$1
echo -e "Given username for new user is:\t\t$USERNAME"

# Testing variables comment out for real
PASSWD=/home/pc/scripts/pwdtest
GRP=/home/pc/scripts/grptest
SHDW=/home/pc/scripts/shdwtest

# Get first available userid by finding highest and adding 1
NEXT_UID=$(( $(awk -F: '$3>=1000  && $3<65534 {printf "%s\n",$3}' $PASSWD | sort -nr | head -1) + 1))
#format      usrname: pwd: uid:   groupid:  username:  homedir:       shell
PASSWD_LINE="$USERNAME::$NEXT_UID:$NEXT_UID:$USERNAME:/home/$USERNAME:/bin/bash"
echo -e "Next available UID is:\t\t\t$NEXT_UID"

# Generate private group for user
GRP_LINE="$USERNAME::$NEXT_UID:"
echo -e "Group information for $USERNAME:\t\t$GRP_LINE"

# Below is untested code, exit before
exit 0

## No operative user exists it seems like?
## Cant find information on how to substitute this part of exercise

# Add user to group and passwd files
echo "Adding $USERNAME to system files"
echo $PASSWD_LINE >> $PASSWD
echo $GRP_LINE >> $GRP
echo "$USERNAME:::::::::" >> $SHDW


# Generate directory for new user with correct permissions
echo "Generating home directory for $USERNAME"
mkdir -m 750 /home/$USERNAME    # permissions should be 750
# There is also mkhomedir_helper  that probably does same as above but better

# Set password default to 1234 for new user, requires sudo i assume
echo "$USERNAME:1234" | chpasswd