#!/bin/bash

read -p "git user.name: " gitUserName
read -p "git user.email: " gitUserEmail
read -p "windows user name: " winUser
read -p "Enter your acount name: " username
read -s -p "Enter your password: " password

# add user and passwd
echo -e "${password}\n${password}" | passwd root
useradd -m -G wheel ${username}
echo -e "${password}\n${password}" | passwd ${username}

# fix cuda linking files and change login user 
mkdir /usr/lib/wsl/lib2
ln -s /mnt/c/Windows/System32/lxss/lib/* /usr/lib/wsl/lib2
touch /etc/wsl.conf
echo "[user]" >> /etc/wsl.conf
echo "default=${username}" >> /etc/wsl.conf
echo "[automount]" >> /etc/wsl.conf
echo "ldconfig=false" >> /etc/wsl.conf
sed -i '/lib/s/$/2/' /etc/ld.so.conf.d/ld.wsl.conf

# Update arch and install vim, base-devel, git, wget, cronie, system fonts, zsh
pacman-key --init
pacman-key --populate archlinux
pacman -Syu vim git wget adobe-source-sans-fonts cronie base-devel zsh --noconfirm

# let wheel group use sudo
sed -i '0, /%wheel/s/^# //' /etc/sudoers

# change zsh as default shell for user
chsh -s /usr/bin/zsh ${username}

# copy settings for user
mv /root/ArchWslSettingUp/install.sh /home//${username}/.distrod_install.sh
cp update.sh /home/${username}/.update.sh
cp zshrc /home/${username}/zshrc_backup
cp vimrc /home/${username}/.vimrc
ln -s /mnt/c/Users/${winUser}/OneDrive /home/${username}/
cp -r /root/ArchWslSettingUp/anacron /home/${username}/.anacron
sed -i "s/password/${password}/" /home/${username}/.update.sh

# change file ownership for files in user dir
chown -R ${username} /home/${username}/
chgrp -R ${username} /home/${username}/

# install oh_my_zsh, set git user info and enable systemd for user
cd /home/${username}
su - ${username} << EOF
sh -c $(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)
EOF
su - ${username} << EOF
git config --global user.name "${gitUserName}"
git config --global user.email "${gitUserEmail}"
mv /home/${username}/zshrc_backup /home/${username}/.zshrc
echo ${password} | sudo -v -S
sudo /opt/distrod/bin/distrod enable
EOF

# install yay
cd /home/${username}
su - ${username} << EOF
echo ${password} | sudo -v -S
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -sri --noconfirm
cd ..
rm -rf yay
EOF

# clean
cd /root
rm -rf ArchWslSettingUp .cache
rm .viminfo .bash_history
cd /home/${username}
rm .bash*

#install user packages 
su - ${username} << EOF
echo ${password} | sudo -v -S
yay -S openblas eigen fftw boost suitesparse python tk python-matplotlib python-scipy python-mpmath adobe-source-code-pro-fonts texlive-most wolframengine --noconfirm
EOF