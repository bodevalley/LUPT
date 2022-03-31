#!/bin/sh
#opens two terminals that will watch the /etc and /home directories for accesses, changes, or deletions
gnome-terminal -t ETC --geometry=100x200 -- inotifywait -m -r /etc -e access -modify -e moved_to -e delete >> log.etc
gnome-terminal -t HOME --geometry=100x200 -- inotifywait -m -r /home -e access -modify -e moved_to -e delete >> log.home
