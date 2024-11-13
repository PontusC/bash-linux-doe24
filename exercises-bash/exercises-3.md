# Exercises chapter 3
### 1. Create 3 variables, VAR1, VAR2 and VAR3; initialize them to hold the values "thirteen", "13" and "Happy Birthday" respectively.
Do in shell `VAR1=thirteen; VAR2=13; VAR3="Happy Birthday"`

### 2. Display the values of all three variables.
Do `echo $VAR{1,2,3}`.

### 3. Are these local or global variables?
Local, can be seen by doing `printenv | grep VAR` vs `set | grep VAR` or a diff. You only find the `VAR#` variables in set.

Note that since these are not exported they will not be passed to any child processes of current shell.

### 4. Remove VAR3.
Do `unset VAR3`

### 5. Can you see the two remaining variables in a new terminal window?
No

### 6. Edit `/etc/profile` so that all users are greeted upon login
Add `printf "Hello, $USER\n"` to profile.

### 7. For the root account, set the prompt to something like "Danger!! root is doing stuff in \w", preferably in a bright color such as red or pink or in reverse video mode.
Run `sudo su` to get access to `/root/.bashrc` and change `PS1`to `PS1="\e[0;35m[Danger! Root is doing stuff in \w]\$\e[m "`

### 8. Make sure that newly created users also get a nice personalized prompt which informs them on which system in which directory they are working. Test your changes by adding a new user and logging in as that user.
In `/etc/skel` edit `.bashrc` to make `PS1` fit above. Was default already fixed.

### 9. Write a script in which you assign two integer values to two variables. The script should calculate the surface of a rectangle which has these proportions. It should be aired with comments and generate elegant output.
See script `/shell-scripts/ex3-9.sh`
