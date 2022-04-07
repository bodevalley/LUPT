backupCron() {

sudo mkdir ~/.backupCron
sudo mkdir ~/.backupCron/apache
sudo mkdir ~/.backupCron/bind
sudo mkdir ~/.backupCron/mysql
sudo mkdir ~/.backupCron/ftp
sudo mkdir ~/.backupCron/important

(crontab -l ; echo "5 * * * * cp -f /etc/apache2/* ~/.backupCron/apache/") | crontab -
(crontab -l ; echo "5 * * * * cp -f /etc/bind/* ~/.backupCron/bind/") | crontab -
(crontab -l ; echo "5 * * * * cp -f /etc/mysql/* ~/.backupCron/mysql/") | crontab -
(crontab -l ; echo "5 * * * * cp -f /etc/vsftpd/* ~/.backupCron/ftp/") | crontab -
(crontab -l ; echo "5 * * * * cp -f /etc/passwd ~/.backupCron/important/") | crontab -
(crontab -l ; echo "5 * * * * cp -f /etc/network/interfaces ~/.backupCron/important/") | crontab -
(crontab -l ; echo "5 * * * * cp -f /etc/netplan/* ~/.backupCron/important/") | crontab -

}
