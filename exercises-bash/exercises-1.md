# Exercises chapter 1
### 1. Where is the **bash** program located on your system?
`/bin/bash`

### 2. Use the **--version** option to find out which version you are running.
`5.2.21`

### 3. Which shell configuration files are read when you login to your system using the graphical user interface and then opening a terminal window?
`.bashrc`

### 4. Are the following shells interactive shells? Are they login shells?
- 1. A shell opened by clicking on the background of your graphical desktop, selecting "Terminal" or such from a menu.

        `Interactive but not login`
- 2. A shell that you get after issuing the command ssh localhost.

        `Interactive and login`
- 3. A shell that you get when logging in to the console in text mode.

        `Interactive and login`
- 4. A shell obtained by the command xterm &.

        `-`
- 5. A shell opened by the mysystem.sh script.

        `Not interactive and not login`
- 6. A shell that you get on a remote host, for which you didn't have to give the login and/or password because you use SSH and maybe SSH keys.

        `Interactive and login`

### 5. Can you explain why **bash** does not exit when you type **Ctrl+C** on the command line?
`Handled by capturing SIGINT`

### 6. Display directory stack content
Run `echo $DIRSTACK` or `dirs`

### 7. If it is not yet the case, set your prompt so that it displays your location in the file system hierarchy
By default

### 8. Display hashed commands for your current shell session.
Run `hash`

### 9. How many processes are currently running on your system?
Run `ps aux --no-heading | wc -l`, prints all proccesses without heading and counts lines

### 10. How to display the system hostname?
Run `echo $HOSTNAME`