# Exercises chapter 4
### 1. Display a list of all the users on your system who log in with the Bash shell as a default.
Run `grep bash /etc/passwd | grep -v nologin`. Matches all users that login with bash and dont have a stated nologin.

### 2. From the `/etc/group` directory, display all lines starting with the string `daemon`.
Run `grep ^daemon group`.

### 3. Print all the lines from the same file that dont contain the string.
Run `grep -v daemon group`.

### 4. Display localhost information from the `/etc/hosts` file, display the line number(s) matching the search string and count the number of occurrences of the string.
Run `grep -n localhost hosts` to display localhost information with line numbers.
Run `grep -o localhost hosts | wc -w` to count occurences of `localhost`.

### 5. Display a list of `/usr/share/doc` subdirectories containing information about shells.
Run `find /usr/share/doc -name "*shell*" -type d`

### 6. How many README files do these subdirectories contain? Don't count anything in the form of `README.a_string`.

Run `find /usr/share/doc -name "*shell*" -type d -execdir find "{}" "-name" "README" ";" | wc -w`. Finds all directories containing the string `shell` and for every matched directory runs the second find for any file called `README`. Finds 1 file.

### 7. Make a list of files in your home directory that were changed less than 10 hours ago, using grep, but leave out directories.
Run `ls -lAgG --time-style=+%s | grep -v "^d" | awk -vtenhours=$(date +%s -d "10 hours ago") '$4 > tenhours {print $5}'`

`ls -lAgG --time-style=+%s` Lists almost all (-A) files and directories in a list format (-l) without group or owner (-gG), and formats the time to unix-time. 

`grep -v "^d"` Removes anything that begins with d, which would be directories

`awk -vtenhours=$(date +%s -d "10 hours ago") '$4 > tenhours {print $5}'` Gets input of the format `-rwxrwxrwx link-count block-size unix-time file`

The entire input is stored in `$0`, and the rest is mapped as follows: `$1, $2, $3, $4, $5`
The awk gets the unix-time for 10 hours ago and checks if any file was changed <10 hours ago, and if so prints that filename.


### 8. Put these commands in a shell script that will generate comprehensible output.

### 9. Can you find an alternative for `wc -l`, using grep?

### 10. Using the file system table (`/etc/fstab` for instance), list local disk devices.

### 11. Make a script that checks whether a user exists in `/etc/passwd`. For now, you can specify the user name in the script, you don't have to work with arguments and conditionals at this stage.

### 12. Display configuration files in `/etc` that contain numbers in their names.