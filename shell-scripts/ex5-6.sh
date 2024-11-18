#!/bin/bash

# This script checks for symbolic links and plainfiles based on ls -l
# If file is symlink, preceedes it with a line above "--this is a symlink--"
# If file is a plain file, appends "<-- this is plain file"

OUTPUT="5output"

ls -l / | sed -e '/->/i \--this is a symlink--' -e '/^-/a \<-- this is plain file' > $OUTPUT

