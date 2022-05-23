#!/bin/bash

read -p "Enter your acount name: " username
read -s -p "Enter your password: " password

# add user and passwd
echo -e "${password}\n${password}" | passwd root
useradd -m -G wheel ${username}
echo -e "${password}\n${password}" | passwd ${username}

cp update.sh /home/${username}/.update.sh
cp vimrc /home/${username}/.vimrc
cp -r anacrontab /home/${username}/.anacrontab

# Update arch and install vim, base-devel, git, wget, cronie, system fonts, zsh
pacman-key --init
pacman-key --populate archlinux
pacman -Syu vim git wget adobe-source-sans-fonts cronie base-devel zsh --noconfirm