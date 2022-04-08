netlog(){
iptables -I INPUT -m state -p tcp --state NEW -j LOG --log-prefix='[networklogging] '
cat >/etc/rsyslog.d/00-my_iptables_networklogging.conf <<EOL
:msg,contains,"[networklogging] " -/var/log/iptables_networklogging.log
& stop
EOL
systemctl restart rsyslog
}
