# Exercises chapter 11
### 1. Add a function to your ~/.bashrc config file that automates the printing of man pages. The result should be that you type something like printman <command>, upon which the first appropriate man page rolls out of your printer. Check using a pseudo printer device for testing purposes. <p><p>As an extra, build in a possibility for the user to supply the section number of the man page he or she wants to print.
See [ex11-1.sh](/shell-scripts/ex11-1.sh)

### 2. Create a subdirectory in your home directory in which you can store function definitions. Put a couple of functions in that directory. Useful functions might be, amongs others, that you have the same commands as on DOS or a commercial UNIX when working with Linux, or vice versa. These functions should then be imported in your shell environment when ~/.bashrc is read.
Made a directory called `~/.bashrc_funcs` to store functions.

Add following to `.bashrc`:
```bash
# Import functions from ~/.bashrc_funcs/ if exists
if [ -d ~/.bashrc_funcs ]; then
    for file in ~/.bashrc_funcs/*;do
        [ -f "$file" ] && [[ "$file" = *.sh ]] && . "$file" # Checks if file and if that file ends in .sh
    done
fi
```

After this you can put any and all functions you want to source into that folder, as long as they end with .sh