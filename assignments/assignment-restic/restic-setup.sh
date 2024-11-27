#!/bin/bash

export RESTIC_REPOSITORY=sftp:fedora-vm:/home/pc/restic-repo
export RESTIC_PASSWORD=$(cat /home/pc/restic/password.txt)