#!/bin/bash

read -p "Enter your acount name: " username
read -s -p "Enter your password: " password

# add user and passwd
echo -e "${password}\n${password}" | passwd root
useradd -m -G wheel ${username}
echo -e "${password}\n${password}" | passwd ${username}

cp update.sh /home/${username}/.update.sh
cp zshrc /home/${username}/.zshrc
cp vimrc /home/${username}/.vimrc
cp -r anacrontab /home/${username}/.anacrontab

# Update arch and install vim, base-devel, git, wget, cronie, system fonts, zsh
pacman-key --init
pacman-key --populate archlinux
pacman -Syu vim git wget adobe-source-sans-fonts cronie base-devel zsh --noconfirm

# let wheel group use sudo
sed -i '0, /%wheel/s/^# //' /etc/sudoers

# fix cuda linking files and change login user 
mkdir /usr/lib/wsl/lib2
ln -s /mnt/c/Windows/System32/lxss/lib/* /usr/lib/wsl/lib2
touch /etc/wsl.conf
echo "[user]" >> wsl.conf
echo "default=${username}" >> wsl.conf
echo "[automount]" >> wsl.conf
echo "ldconfig=false" >> wsl.conf
sed -i '/lib/s/$/2/' /etc/ld.so.conf.d/ld.wsl.conf