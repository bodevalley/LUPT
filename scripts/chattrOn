#!/bin/bash

#Use to add immutable flag to sensitive files that should not be changed
#This will prevent users from being created
#Pay careful attention to what files are being given the flag

chattr +i /etc/passwd
chattr +i /etc/shadow
chattr +i /etc/group
chattr +i /etc/gshadow

chattr -R +i /home/$USER/.ssh
