Scan() {
sudo ls -laR / > /tmp/files.txt
grep redteam /tmp/files.txt > /tmp/sus.txt
grep suspicious /tmp/files.txt >> /tmp/sus.txt
grep ncae /tmp/files.txt >> /tmp/sus.txt
grep malware /tmp/files.txt >> /tmp/sus.txt
grep malcious /tmp/files.txt >> /tmp/sus.txt
grep *.dat /tmp/files.txt >> /tmp/sus.txt
grep shell /tmp/files.txt >> /tmp/sus.txt
grep reverse /tmp/files.txt >> /tmp/sus.txt
grep backdoor /tmp/files.txt >> /tmp/sus.txt
}
