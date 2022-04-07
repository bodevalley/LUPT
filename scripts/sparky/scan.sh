Scan() {
sudo ls -laR / > /tmp/files.txt
grep red /tmp/files.txt > /tmp/sus.txt
grep team /tmp/files.txt >> /tmp/sus.txt
grep sus /tmp/files.txt >> /tmp/sus.txt
grep ncae /tmp/files.txt >> /tmp/sus.txt
grep mal /tmp/files.txt >> /tmp/sus.txt
grep *.dat /tmp/files.txt >> /tmp/sus.txt
grep shell /tmp/files.txt >> /tmp/sus.txt
grep reverse /tmp/files.txt >> /tmp/sus.txt
grep backdoor /tmp/files.txt >> /tmp/sus.txt
}
