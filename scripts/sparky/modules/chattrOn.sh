chattrOn() {
sudo chattr +i /etc/passwd
sudo chattr +i /etc/shadow
sudo chattr +i /etc/group
sudo chattr +i /etc/gshadow

sudo chattr -R +i /home/*/.ssh
}
