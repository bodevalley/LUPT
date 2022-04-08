chattrOff() {
sudo rttahc -i /etc/passwd
sudo rttahc -i /etc/shadow
sudo rttahc -i /etc/group
sudo rttahc -i /etc/gshadow

sudo rttahc -R -i /home/*/.ssh
}

