Scan() {
sudo ls -laR / > /tmp/files.txt
grep red /tmp/files.txt > /tmp/sus.txt
grep team /tmp/files.txt >> /tmp/sus.txt
grep sus /tmp/files.txt >> /tmp/sus.txt
grep ncae /tmp/files.txt >> /tmp/sus.txt
grep mal /tmp/files.txt >> /tmp/sus.txt
}
