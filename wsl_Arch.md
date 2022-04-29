1. Let systemd work in wsl2 archlinux
'''
curl -L -O "https://raw.githubusercontent.com/nullpo-head/wsl-distrod/main/install.sh"
chmod +x install.sh
./install.sh install
/opt/distrod/bin/distrod enable
'''
2. Update arch and install vim, sudo
'''
pacman -Syu vim sudo --noconfirm
'''
