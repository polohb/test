#!/bin/bash

# update system
apt update 
apt upgrade -y
apt dist-upgrade -y
apt --purge autoremove

# install some usefull or fancy tools
apt install -y openssh-server sudo vim tmux git curl net-tools neofetch zsh


# install new default user
adduser polohb -gecos "" --disabled-password
echo "polohb ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
mkdir /home/polohb/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCirWH/lr/ln2ovtbBvHJa/1YCE7KOeEM4YPhS1Ys+dJ0g3kfwiILf9rmbM6ixVBzzxqoMojQfglokVKFOk0XjkPuYGB0zxqBtvVnhiYhQiwUZnyXFYSSDIuo2Mz0F4WAV3dDetVrK4P1zhHXEo8MmvFSo7g0SE5ARC6Cd070QjMqoZ1KmR8tylvL7UkBI9OxVQHeNN/dLIlWfNBT9ANt77I2AGPTsOibpzorigjGMV9Ul1K14WXEvA9Ktz1DY9bebqT1l+G9YI/gst3qN2Hdqng93/mPbi8DS+mgBSVOrR1zloJy5pJZVwJy4rkM+z+fk/IKOmOuGOTVbyEV6D36iFEwbkuMmG0OeCeWaIELFqMqd7ib5FNFrG+FNwrNFP1fVuZgCfd6d4RMYvj1SObobBJtu8bt5x1/FPhvVVILBW0idRg5j9dod8BcObQ2OUZ47UUezj5mbacikcq09dl1W0vT1CsVJ2gmjRLJc7wd6p8m5YHi3Z5l9X4SYz2AFdY4+4Kr4K/1IL9M5qelPhbaNnKKl48J8DT4iMoNQPwPKNcRlKE9zq3nmbDL47jsQ/UV/hoj0Zn/b9QvdMg2iyBWhLK6v56LQ1uSnRXnlELySZDPgJO/pWBt1x7hifY2uFSVo0O//X7FtrC5mWf29SQg2DVOrasOF/x//TqzZESRmwiQ== paul@debian-JL" > /home/polohb/.ssh/authorized_keys
chown polohb:polohb  /home/polohb/ -R


# install docker
apt remove docker docker-engine docker.io containerd runc
apt install -y apt-transport-https ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt update
apt install -y docker-ce docker-ce-cli containerd.io
usermod -aG docker polohb
systemctl enable docker.service
systemctl enable containerd.service
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

