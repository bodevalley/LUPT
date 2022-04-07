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
