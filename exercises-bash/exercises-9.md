# Exercises chapter 9
### 1. Create a script that will take a (recursive) copy of files in /etc so that a beginning system administrator can edit files without fear.
See [ex9-1.sh](/shell-scripts/ex9-1.sh).

### 2. Write a script that takes exactly one argument, a directory name. If the number of arguments is more or less than one, print a usage message. If the argument is not a directory, print another message. For the given directory, print the five biggest files and the five files that were most recently modified.
See [ex9-2.sh](/shell-scripts/ex9-2.sh).

### 3. Can you explain why it is so important to put the variables in between double quotes in the example from Section 9.4.2?
If you dont double quote it will expand it literally including whitespace. A filename "a file.txt" would just be inserted with whitespace not being properly dealt with. Quoting for expansion escapes(?) the whitespace and other characters.

### 4. Write a script similar to the one in Section 9.5.1, but think of a way of quitting after the user has executed 3 loops.
See [ex9-4.sh](/shell-scripts/ex9-4.sh), use a counter to check # of loops.

### 5. Think of a better solution than move -b for the script from Section 9.5.3 to prevent overwriting of existing files. For instance, test whether or not a file exists. Don't do unnecessary work!

### 6. Rewrite the whichdaemon.sh script from Section 7.2.4. See book for requirements