This is the quick setting up script for Arch in WSL2, using zsh by default shell, autoupdate check every time you login.
Install [Arch in WSL2](https://github.com/yuk7/ArchWSL)
Login as root then run
```
cd ~
git clone https://github.com/Shengyis/ArchWslSettingUp.git
cd ArchWslSettingUp
./settingup.sh
```
Reboot ArchLinux, and enjoy. 
Optional, install oh-my-zsh via CN mirror:
```
git clone https://mirrors.tuna.tsinghua.edu.cn/git/ohmyzsh.git
cd ohmyzsh/tools
REMOTE=https://mirrors.tuna.tsinghua.edu.cn/git/ohmyzsh.git sh install.sh
```
in zsh, setup autoupdate via mirror and install other packagtes:
```
git -C $ZSH remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/ohmyzsh.git
git -C $ZSH pull
# setup and clean
mv -f ~/zshrc_backup ~/.zshrc
rm ~/settingup2.sh ~/.bash*
rm -rf ~/ohmyzsh
# install other packages
sudo pacman -S blas-openblas blas64-openblas python tk python-matplotlib python-scipy python-mpmath python-cupy --noconfirm
```
