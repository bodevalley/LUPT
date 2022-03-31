# Put this in /etc/profile.d/ 
trap 'echo $(date +%d/%m/%Y%t%H:%M:%S):"$BASH_COMMAND" >> /var/log/cmd.log' DEBUG




# You guys are doing awesome! =D