log_cmd(){
	touch /etc/profile.d/zloggingbash.sh
	echo $'trap \'echo "$ECHO":"$BASH_COMMAND" >> /var/log/cmd.log\' DEBUG' >> /etc/profile.d/zloggingbash.sh
	touch /var/log/cmd.log
	chmod 666 /var/log/cmd.log
}