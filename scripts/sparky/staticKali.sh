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
