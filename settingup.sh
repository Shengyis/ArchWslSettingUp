#!/bin/bash

# read -p "git user.name: " gitUserName
# read -p "git user.email: " gitUserEmail
read -p "Enter your acount name: " username
read -s -p "Enter your password: " password

# add user and passwd
echo -e "${password}\n${password}" | passwd root
useradd -m -G wheel ${username}
echo -e "${password}\n${password}" | passwd ${username}

# fix cuda linking files and change login user 
mkdir /usr/lib/wsl/lib2
ln -s /mnt/c/Windows/System32/lxss/lib/* /usr/lib/wsl/lib2
# add config to [automount]
echo "ldconfig=false" >> /etc/wsl.conf
echo "[user]" >> /etc/wsl.conf
echo "default=${username}" >> /etc/wsl.conf
sed -i '/lib/s/$/2/' /etc/ld.so.conf.d/ld.wsl.conf

# set local
sed -i '/en_US.UTF/s/^#//' /etc/locale.gen
locale-gen

# add CN source and switch to archlinuxcn community
sed -i '1i Server = https://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorlist
echo "[archlinuxcn]" >> /etc/pacman.conf
echo 'Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch' >> /etc/pacman.conf

# show progress bar for pacman
# sed -i '/NoProgressBar/s/^/#/' /etc/pacman.conf

# update key first
pacman-key --init
pacman-key --populate
pacman-key --lsign-key "farseerfc@archlinux.org"
pacman -Sy archlinux-keyring archlinuxcn-keyring --noconfirm

# remove unnecessary packages preinstalled by ArchLinux
pacman -Rsn arch-install-scripts less nano vim --noconfirm

# Update arch and install base-devel, git, wget, cronie, system fonts, zsh
pacman -Syyu --needed git wget adobe-source-code-pro-fonts cronie base-devel zsh gvim --noconfirm

# let wheel group use sudo
sed -i '0, /%wheel/s/^# //' /etc/sudoers

# change zsh as default shell for user
chsh -s /usr/bin/zsh ${username}

# copy settings for user
cp update.sh /home/${username}/.update.sh
cp zshrc /home/${username}/zshrc_backup
cp vimrc /home/${username}/.vimrc
cp -r /root/ArchWslSettingUp/anacron /home/${username}/.anacron
sed -i "s/password/${password}/" /home/${username}/.update.sh

# change file ownership for files in user dir
chown -R ${username} /home/${username}/
chgrp -R ${username} /home/${username}/

# set git user info
# cd /home/${username}
# su - ${username} << EOF
# git config --global user.name "${gitUserName}"
# git config --global user.email "${gitUserEmail}"
# EOF

# clean
cd /root
rm -rf ArchWslSettingUp .cache
rm .bash_history
cd /home/${username}
rm .bash*

echo "restart and enjoy"
