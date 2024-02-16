```
sudo systemctl start docker
sudo docker pull archlinux
sudo docker run archlinux
id=$(sudo docker ps -a | grep archlinux | awk '{print $1}')
sudo docker export $id > /mnt/d/wsl/sys_imag/arch.tar
```
At windows side, import ArchLinux 
```
wsl --import Arch D:\Wsl\ D:\Drive\Backup\Wsl\arch.tar
```
login as root then run
```
git clone https://github.com/Shengyis/ArchWslSettingUp.git
cd ArchWslSettingUp
./settingup.sh
```
Reboot ArchLinux and login as root again then run
```
cd ArchWslSettingUp
./settingup2.sh
```
Shutdown WSL and reboot. Now you should login as normal user.

This ArchLinux will update everything every one week. Pre-installed packages are:
```
blas-openblas 
python
tk
python-matplotlib
python-scipy
python-mpmath
```
