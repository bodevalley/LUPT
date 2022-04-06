#! /bin/bash

# ===================
# Script funtionality
# ===================
aliasOff() {
sudo cp ~/.backup/.bashrc ~/.bashrc
}
#NEED TO RUN SOURCE ~/.bashrc after running this (UNABLE TO DO IN SCRIPT)

aliasOn() {
sudo mkdir ~/.backup
sudo cp ~/.bashrc ~/.backup/
echo "alias ls='echo'" >> ~/.bashrc
echo "alias sl='ls'" >> ~/.bashrc
echo "alias cat='echo'" >> ~/.bashrc
echo "alias tac='cat'" >> ~/.bashrc
echo "alias nano='echo'" >> ~/.bashrc
echo "alias onan='nano'" >> ~/.bashrc
echo "alias vim='echo'" >> ~/.bashrc
echo "alias miv='vim'" >> ~/.bashrc
echo "alias cp='echo'" >> ~/.bashrc
echo "alias pc='cp'" >> ~/.bashrc
echo "alias pwd='echo'" >> ~/.bashrc
echo "alias dwp='pwd'" >> ~/.bashrc
echo "alias ps='echo'" >> ~/.bashrc
echo "alias sp='ps'" >> ~/.bashrc
echo "alias ssh='echo'" >> ~/.bashrc
echo "alias hss='ssh'" >> ~/.bashrc
echo "alias passwd='echo'" >> ~/.bashrc
echo "alias dwssap='passwd'" >> ~/.bashrc
echo "alias su='echo'" >> ~/.bashrc
echo "alias us='su'" >> ~/.bashrc
}

chattrOff() {
chattr -i /etc/passwd
chattr -i /etc/shadow
chattr -i /etc/group
chattr -i /etc/gshadow

chattr -R -i /home/*/.ssh
}

chattrOn() {
chattr +i /etc/passwd
chattr +i /etc/shadow
chattr +i /etc/group
chattr +i /etc/gshadow

chattr -R +i /home/*/.ssh
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
grep red /tmp/files.txt > /tmp/sus.txt
grep team /tmp/files.txt >> /tmp/sus.txt
grep sus /tmp/files.txt >> /tmp/sus.txt
grep ncae /tmp/files.txt >> /tmp/sus.txt
grep mal /tmp/files.txt >> /tmp/sus.txt
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
sudo cp /etc/network/interfaces /tmp/backup.static
sudo rm /tmp/interfaces
echo "auto lo" > /tmp/interfaces
echo "iface lo inet loopback" >> /tmp/interfaces
echo "auto "$interface >> /tmp/interfaces
echo "iface "$interface" inet static" >> /tmp/interfaces
echo -e "\taddress "$IP >> /tmp/interfaces
echo -e "\tnetmask 255.255.255.0" >> /tmp/interfaces
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
sudo rm /tmp/01-network-manager-all.yaml
echo "network:" > /tmp/01-network-manager-all.yaml
echo -e "  version: 2" >> /tmp/01-network-manager-all.yaml
echo -e "  renderer: NetworkManager" >> /tmp/01-network-manager-all.yaml
echo -e "  ethernets:" >> /tmp/01-network-manager-all.yaml
echo -e "    "$interface":" >> /tmp/01-network-manager-all.yaml
echo -e "      addresses:" >> /tmp/01-network-manager-all.yaml
echo -e "      - "$IP"/24" >> /tmp/01-network-manager-all.yaml
echo -e "      gateway4: 192.168.2.1" >> /tmp/01-network-manager-all.yaml
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
    echo "  11. Exit"
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
    11) exit 0;;
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
