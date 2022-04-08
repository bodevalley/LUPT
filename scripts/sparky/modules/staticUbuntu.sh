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

