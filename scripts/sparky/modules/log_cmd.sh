log_cmd(){
	cp zloggingbash.sh /etc/profile.d/
	touch /var/log/cmd.log
	chmod 666 /var/log/cmd.log
}