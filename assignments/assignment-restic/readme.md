## Contents
Contains all files needed for a custom systemd timer that runs restic to backup files via SSH.

Timer triggers 5 minutes or specified time after each boot.

### To setup restic
Run `restic init` once after sourcing the config file and making your password.txt.

### To enable the timer
.timer and .service need to be placed under `/etc/systemd/system`

Enable it by default with `systemctl enable test.timer`.

Can see the timer after boot using `systemctl list-timers --all`.
Can test it immediately by running `systemctl daemon-reload` for changes and then `systemctl start restic-backup`
