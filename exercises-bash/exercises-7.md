# Exercises chapter 7
### 1. Use an if/then/elif/else construct that prints information about the current month. The script should print the number of days in this month, and give information about leap years if the current month is February.
See [ex7-1.sh](/shell-scripts/ex7-1.sh)

### 2. Do the same, using a case statement and an alternative use of the date command.
See [ex7-2.sh](/shell-scripts/ex7-2.sh)

### 3. Modify /etc/profile so that you get a special greeting message when you connect to your system as root.
Add `if [ "$(whoami)" == "root" ] ; then echo "you are root" ; fi` in the file.

### 4. Edit the leaptest.sh script from Section 7.2.4 so that it requires one argument, the year. Test that exactly one argument is supplied.
See [ex7-4.sh](/shell-scripts/ex7-4.sh)

### 5. Write a script called whichdaemon.sh that checks if the httpd and init daemons are running on your system. If an httpd is running, the script should print a message like, "This machine is running a web server." Use ps to check on processes.
See [whichdaemon.sh](/shell-scripts/whichdaemon.sh)

### 6. Write a script that makes a backup of your home directory on a remote machine using scp. The script should report in a log file, for instance ~/log/homebackup.log. If you don't have a second machine to copy the backup to, use scp to test copying it to the localhost. This requires SSH keys between the two hosts, or else you have to supply a password. The creation of SSH keys is explained in man ssh-keygen.

### 7. See book too long.

