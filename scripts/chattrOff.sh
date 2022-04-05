#!/bin/bash

#Use to remove immutable flag to sensitive files that need to be changed

chattr -i /etc/passwd
chattr -i /etc/shadow
chattr -i /etc/group
chattr -i /etc/gshadow

chattr -R -i /home/$USER/.ssh
