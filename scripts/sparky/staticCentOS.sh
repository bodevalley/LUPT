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
