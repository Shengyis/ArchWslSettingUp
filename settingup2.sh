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
echo "[user]" >> /etc/wsl.conf
echo "default=${username}" >> /etc/wsl.conf
echo "[automount]" >> /etc/wsl.conf
echo "ldconfig=false" >> /etc/wsl.conf
sed -i '/lib/s/$/2/' /etc/ld.so.conf.d/ld.wsl.conf

# set local
sed -i '/en_US.UTF/s/^#//' /etc/locale.gen
locale-gen

# add CN source and switch to archlinuxcn community
sed -i '1i Server = https://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorlist
echo "[archlinuxcn]" >> /etc/pacman.conf
echo 'Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch' >> /etc/pacman.conf

# show progress bar for pacman
sed -i '/NoProgressBar/s/^/#/' /etc/pacman.conf

# update key first
pacman -Sy
pacman -S gnupg --noconfirm
pacman-key --init
pacman-key --populate archlinux
pacman -Syyu archlinux-keyring archlinuxcn-keyring --noconfirm

# Update arch and install gvim, base-devel, git, wget, cronie, system fonts, zsh
pacman -Syyu gvim git wget adobe-source-code-pro-fonts cronie base-devel zsh --noconfirm

# let wheel group use sudo
sed -i '0, /%wheel/s/^# //' /etc/sudoers

# change zsh as default shell for user
chsh -s /usr/bin/zsh ${username}

# copy settings for user
cp update.sh /home/${username}/.update.sh
cp zshrc /home/${username}/zshrc_backup
cp vimrc /home/${username}/.vimrc
cp settingup3.sh /home/${username}/settingup3.sh
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

#install user packages 
su - ${username} << EOF
echo ${password} | sudo -v -S
sudo pacman -S blas-openblas blas64-openblas python tk python-matplotlib python-scipy python-mpmath python-cupy --noconfirm
EOF

echo "restart and run settingup3.sh"
