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
Reboot ArchLinux and install your own packages. For example:
```
sudo pacman -S blas-openblas blas64-openblas python tk python-matplotlib python-scipy python-mpmath python-cupy --noconfirm
```
