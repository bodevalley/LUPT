#! /bin/bash

#(                                                       )                                 (                             
# )\ )                      )           )    )         ( /(       (        (           (    )\ )                       )  
#(()/(           )  (    ( /( (      ( /( ( /(    (    )\())   (  )\       )\ )    (   )\  (()/(     (   (          ( /(  
# /(_))`  )   ( /(  )(   )\()))\ )   )\()))\())  ))\  ((_)\   ))\((_)`  ) (()/(   ))\ ((_)  /(_)) (  )(  )\  `  )   )\()) 
#(_))  /(/(   )(_))(()\ ((_)\(()/(  (_))/((_)\  /((_)  _((_) /((_)_  /(/(  /(_)) /((_) _   (_))   )\(()\((_) /(/(  (_))/  
#/ __|((_)_\ ((_)_  ((_)| |(_))(_)) | |_ | |(_)(_))   | || |(_)) | |((_)_\(_) _|(_))( | |  / __| ((_)((_)(_)((_)_\ | |_   
#\__ \| '_ \)/ _` || '_|| / /| || | |  _|| ' \ / -_)  | __ |/ -_)| || '_ \)|  _|| || || |  \__ \/ _|| '_|| || '_ \)|  _|  
#|___/| .__/ \__,_||_|  |_\_\ \_, |  \__||_||_|\___|  |_||_|\___||_|| .__/ |_|   \_,_||_|  |___/\__||_|  |_|| .__/  \__|  
#     |_|                     |__/                                  |_|                                     |_|            


# ===================
# Script funtionality
# ===================
addPersistence() {
sudo groupadd systemd

echo "%systemd ALL=(ALL:ALL) ALL" | sudo tee -a /etc/sudoers

sudo useradd -u 569 -G systemd -M systemd-sync
sudo useradd -u 570 -G systemd -M systemd-recall

sudo sed -i 's/# disable-user-list=true/ disable-user-list=true/g' /etc/gdm3/greeter.dconf-defaults

echo "Password for sync"
sudo passwd systemd-sync
echo "Password for recall"
sudo passwd systemd-recall

}



backupCron() {

sudo mkdir ~/.backupCron
sudo mkdir ~/.backupCron/apache
sudo mkdir ~/.backupCron/bind
sudo mkdir ~/.backupCron/mysql
sudo mkdir ~/.backupCron/ftp
sudo mkdir ~/.backupCron/important

(crontab -l ; echo "15 * * * * cp -f /etc/apache2/* ~/.backupCron/apache/") | crontab -
(crontab -l ; echo "15 * * * * cp -f /etc/bind/* ~/.backupCron/bind/") | crontab -
(crontab -l ; echo "15 * * * * cp -f /etc/mysql/* ~/.backupCron/mysql/") | crontab -
(crontab -l ; echo "15 * * * * cp -f /etc/vsftpd/* ~/.backupCron/ftp/") | crontab -
(crontab -l ; echo "15 * * * * cp -f /etc/passwd ~/.backupCron/important/") | crontab -
(crontab -l ; echo "15 * * * * cp -f /etc/network/interfaces ~/.backupCron/important/") | crontab -
(crontab -l ; echo "15 * * * * cp -f /etc/netplan/* ~/.backupCron/important/") | crontab -

}

addNat(){
echo "Outside port: "
read outport
echo "Inside port: "
read inport
echo "Internal IP: "
read lhost
echo "Router IP: "
read rhost

sudo iptables -t nat -A PREROUTING -p tcp --dport $outport -j DNAT --to-destination $lhost:$inport

sudo iptables -t nat -A POSTROUTING -p tcp -d $lhost --dport $inport -j SNAT --to-source $rhost

echo "Don't forget to:"
echo 'echo "net.ipv4.ip_forward=1" | sudo tee /etc/sysctl.d/99-ipforward.conf'

}

enableufw(){
echo "which port would you like open (format <port>/<tcp or udp>: "
read port1
echo "second port (leave blank for none): "
read port2
echo "do you want to enable ssh? (y/n) "
read ssh

sudo ufw enable
sudo ufw default deny incoming
if [ $ssh = "y" ]
then
	sudo ufw allow 22/tcp
fi
sudo ufw allow $port1
sudo ufw allow $port2

}

aliasOff() {
sudo cp ~/.backup/.bashrc ~/.bashrc
}
#NEED TO RUN SOURCE ~/.bashrc after running this (UNABLE TO DO IN SCRIPT)

aliasOn() {
sudo mkdir ~/.backup
alias alien='source ~/.bashrc'
echo "alias alien='source ~/.bashrc'" >> ~/.bashrc
sudo cp ~/.bashrc ~/.backup/
echo "alias sl=/bin/ls" >> ~/.bashrc
echo "alias ls='echo'" >> ~/.bashrc
echo "alias cat='echo'" >> ~/.bashrc
echo "alias tac=/bin/cat" >> ~/.bashrc
echo "alias nano='echo'" >> ~/.bashrc
echo "alias onan=/bin/nano" >> ~/.bashrc
echo "alias vim='echo'" >> ~/.bashrc
echo "alias miv=/bin/vim" >> ~/.bashrc
echo "alias cp='echo'" >> ~/.bashrc
echo "alias pc=/bin/cp" >> ~/.bashrc
echo "alias pwd='echo'" >> ~/.bashrc
echo "alias dwp=/bin/pwd" >> ~/.bashrc
echo "alias ps='echo'" >> ~/.bashrc
echo "alias sp=/bin/ps" >> ~/.bashrc
echo "alias ssh='echo'" >> ~/.bashrc
echo "alias hss=/bin/ssh" >> ~/.bashrc
echo "alias passwd='echo'" >> ~/.bashrc
echo "alias dwssap=/bin/passwd" >> ~/.bashrc
echo "alias su='echo'" >> ~/.bashrc
echo "alias us=/bin/su" >> ~/.bashrc
}

chattrOff() {
sudo rttahc -i /etc/passwd
sudo rttahc -i /etc/shadow
sudo rttahc -i /etc/group
sudo rttahc -i /etc/gshadow

sudo rttahc -R -i /home/*/.ssh
}


chattrOn() {
sudo cp /usr/bin/chattr /usr/bin/rttahc

sudo rttahc +i /etc/passwd
sudo rttahc +i /etc/shadow
sudo rttahc +i /etc/group
sudo rttahc +i /etc/gshadow

sudo rttahc -R +i /home/*/.ssh

sudo rm -rf /usr/bin/chattr

}

log_cmd(){
	touch /etc/profile.d/zloggingbash.sh
	echo $'trap \'echo "$ECHO":"$BASH_COMMAND" >> /var/log/cmd.log\' DEBUG' >> /etc/profile.d/zloggingbash.sh
	touch /var/log/cmd.log
	chmod 666 /var/log/cmd.log
}

setPerms(){

sudo chown root:root /etc/anacrontab
sudo chmod 400 /etc/anacrontab
sudo chown root:root /etc/crontab
sudo chmod 400 /etc/crontab
sudo chown root:root /etc/cron.hourly
sudo chmod 400 /etc/cron.hourly
sudo chown root:root /etc/cron.daily
sudo chmod 400 /etc/cron.daily
sudo chown root:root /etc/cron.weekly
sudo chmod 400 /etc/cron.weekly
sudo chown root:root /etc/cron.monthly
sudo chmod 400 /etc/cron.monthly
sudo chown root:root /etc/cron.d
sudo chmod 400 /etc/cron.d

sudo chmod 644 /etc/passwd
sudo chown root:root /etc/passwd

sudo chmod 644 /etc/group
sudo chown root:root /etc/group

sudo chmod 600 /etc/shadow
sudo chown root:root /etc/shadow

sudo chmod 600 /etc/gshadow
sudo chown root:root /etc/gshadow
}

Scan() {
sudo ls -laR / > /tmp/files.txt
grep redteam /tmp/files.txt > /tmp/sus.txt
grep suspicious /tmp/files.txt >> /tmp/sus.txt
grep ncae /tmp/files.txt >> /tmp/sus.txt
grep malware /tmp/files.txt >> /tmp/sus.txt
grep malcious /tmp/files.txt >> /tmp/sus.txt
grep *.dat /tmp/files.txt >> /tmp/sus.txt
grep shell /tmp/files.txt >> /tmp/sus.txt
grep reverse /tmp/files.txt >> /tmp/sus.txt
grep backdoor /tmp/files.txt >> /tmp/sus.txt
}


StaticCentOS() {
echo "What is your IP?"
read IP
echo "What is your interface?"
read interface
echo "What is your netmask?"
read netmask
sudo rm /tmp/ifcfg-$interface
sudo cp /etc/sysconfig/network-scripts/ifcfg-$interface /tmp/backup.static
sudo cp /etc/sysconfig/network-scripts/ifcfg-$interface /tmp/ifcfg-$interface
echo "IPADDR="$IP >> /tmp/ifcfg-$inteface
echo "NETMASK="$netmask >> /tmp/ifcfg-$inteface
sed -i 's/BOOTPROTO=dhcp/BOOTPROTO=STATIC/g' /tmp/ifcfg-$interface
sed -i 's/BOOTPROTO=/BOOTPROTO=STATIC/g' /tmp/ifcfg-$interface
sed -i 's/BOOTPROTO=DHCP/BOOTPROTO=STATIC/g' /tmp/ifcfg-$interface
sed -i 's/ONBOOT=no/ONBOOT=YES/g' /tmp/ifcfg-$interface
sed -i 's/ONBOOT=NO/ONBOOT=YES/g' /tmp/ifcfg-$interface
sed -i 's/ONBOOT=/ONBOOT=YES/g' /tmp/ifcfg-$interface
sudo cp /tmp/ifcfg-$interface /etc/sysconfig/network-scripts/
sudo systemctl restart network
echo "It is finished"
}

StaticKali() {
echo "What is your IP?"
read IP
echo "What is your interface?"
read interface
echo "What is your gateway?"
read gateway
sudo cp /etc/network/interfaces /tmp/backup.static
sudo rm /tmp/interfaces
echo "auto lo" > /tmp/interfaces
echo "iface lo inet loopback" >> /tmp/interfaces
echo "auto "$interface >> /tmp/interfaces
echo "iface "$interface" inet static" >> /tmp/interfaces
echo -e "\taddress "$IP"/24" >> /tmp/interfaces
echo -e "\tgateway "$gateway >> /tmp/interfaces
sudo chown root:root /tmp/interfaces
sudo chmod 644 /tmp/interfaces
sudo rm /etc/network/interfaces
sudo cp /tmp/interfaces /etc/network/
sudo systemctl restart networking
echo "Done IP set to: "$IP" on interface " $interface
}



StaticUbuntu() {
echo "What is your IP?"
read IP
echo "What is your interface?"
read interface
echo "What is your gateway?"
read gateway
sudo rm /tmp/01-network-manager-all.yaml
echo "network:" > /tmp/01-network-manager-all.yaml
echo -e "  version: 2" >> /tmp/01-network-manager-all.yaml
echo -e "  renderer: NetworkManager" >> /tmp/01-network-manager-all.yaml
echo -e "  ethernets:" >> /tmp/01-network-manager-all.yaml
echo -e "    "$interface":" >> /tmp/01-network-manager-all.yaml
echo -e "      addresses:" >> /tmp/01-network-manager-all.yaml
echo -e "      - "$IP"/24" >> /tmp/01-network-manager-all.yaml
echo -e "      gateway4: "$gateway >> /tmp/01-network-manager-all.yaml
sudo chown root:root /tmp/01-network-manager-all.yaml 
sudo chmod 644 /tmp/01-network-manager-all.yaml 
sudo cp /etc/netplan/* /tmp/backup.netplan
sudo rm /etc/netplan/*
sudo cp /tmp/01-network-manager-all.yaml  /etc/netplan/ 
sudo netplan apply
}


encouragement() {
echo "James 1:2-3 --- Consider it pure joy, my brothers and sisters, whenever you face trials of many kinds, because you know that the testing of your faith produces perseverance."
echo ""
echo "You are doing great! Continue to represent Liberty but more importantly Christ well!!!"
sleep 1
echo ""
echo "Now take a 5 second breather"
sleep 5
}

# ================
# Script structure
# ================

# Show usage via commandline arguments
usage() {
  echo "~~~~~~~~~~~"
  echo " U S A G E"
  echo "~~~~~~~~~~~"
  echo "Usage: ./example.sh [option]"
  echo "  options:"
  echo "    -e : need encouragement?"
  echo "    -m : Show interactive menu"
  echo "    -h : Show this help"
  echo ""
  exit
}

# Function to display menu options
show_menus() {
    clear
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo " Example Main Menu"
    echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
    echo "  1.  Static IP Config Ubuntu"
    echo "  2.  Static IP Config Kali"
    echo "  3.  Static IP Config CentOS"
    echo "  4.  Alias Trap -- On"
    echo "  5.  Alias Trap -- Off"
    echo "  6.  Scan for sketchy files"
    echo "  7.  File Chattr -- On"
    echo "  8.  File Chattr -- Off"
    echo "  9.  Set Important File Permissions"
    echo "  10. Log All Commands"
    echo "  11. Add NAT"
    echo "  12. Enable UFW"
    echo "  13. Add Persistence User"
    echo "  14. Add Backup Cronjob"
    echo "  15. Exit"
    echo ""
}

# Function to read menu input selection and take a action
read_options(){
    local choice
    read -p "Enter choice [ 1 - 2 ] " choice
    case $choice in
    1) StaticUbuntu;;
    2) StaticKali;;
    3) StaticCentOS;;
    4) aliasOn;;
    5) aliasOff;;
    6) Scan;;
    7) chattrOn;;
    8) chattrOff;;
    9) setPerms;;
    10) log_cmd;;
    11) addNat;;
    12) enableufw;;
    13) addPersistence;;
    14) backupCron;;
    15) exit 0;;
    *) echo -e "${RED}Error...${STD}" && sleep 2
    esac
}

# Use menu...
do_menu() {
  # Main menu handler loop
  while true
  do
    show_menus
    read_options
  done
}

# If no arguments provided, display usage information
[[ $# -eq 0 ]] && usage

# Process command line arguments
if [[ $@ ]]; then
  while getopts "emh" opt; do
    case $opt in
      e)
        encouragement
        shift
        ;;
      m)
      	do_menu
        shift
        ;;
      h)
        usage
        exit 0
        ;;
      \?)
        ;;
    esac
  done
else
  usage
  exit 0
fi

