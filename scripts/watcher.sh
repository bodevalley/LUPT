#!/bin/sh
#opens two terminals that will watch the /etc and /home directories for accesses, changes, or deletions
inotifywait -m  /etc/passwd -e access -modify -e moved_to -e delete >> log.etc
inotifywait -m -r /home/ -e access -modify -e moved_to -e delete >> log.home
