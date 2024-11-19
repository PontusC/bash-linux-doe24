# Exercises chapter 5
### 1. Print a list of files in your scripts directory, ending in ".sh". Mind that you might have to unalias ls. Put the result in a temporary file
Run `ls -Al | sed -n '/.*sh/p' > /tmp/sed-temp-1`.

### 2. Make a list of files in /usr/bin that have the letter "a" as the second character. Put the result in a temporary file.
Run `find /usr/bin -printf "%f\n" | sed -n '/^.a/p' > /tmp/sed-temp`

### 3. Delete the first 3 lines of each temporary file
Run `sed -i '1,3d' /tmp/*`.

### 4. Print to standard output only the lines containing the pattern "an".
Run `sed -n '/an/p' <file-name>`.

### 5. Create a file holding sed commands to perform the previous two tasks. Add an extra command to this file that adds a string like "*** This might have something to do with man and man pages ***" in the line preceding every occurence of the string "man". Check the result
See `/shell-scripts/ex5-5.sh`.

### 6. A long listing of the root directory, /, is used for input. Create a file holding sed commands that check for symbolic links and plain files. If a file is a symbolic link, precede it with a line like "--This is a symlink--". If the file is a plain file, add a string on the same line, adding a comment like "<--- this is a plain file".
See [this]`/shell-scripts/ex5-6.sh`

### 7. Create a script that shows lines containing trailing white spaces from a file. This script should use a sed script and show sensible information to the user
See `/shell-scripts/ex5-7.sh`