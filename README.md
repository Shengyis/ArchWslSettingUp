This is the quick setting up script for Arch in WSL2, using zsh by default shell.
Install [Arch in WSL2](https://github.com/yuk7/ArchWSL)
Login as root then run
```
cd ~
git clone https://github.com/Shengyis/ArchWslSettingUp.git
cd ArchWslSettingUp
./settingup.sh
```
Reboot ArchLinux and login as root again then run
```
cd ~/ArchWslSettingUp
./settingup2.sh
```
check settingup.sh to modify the pre-install package.
