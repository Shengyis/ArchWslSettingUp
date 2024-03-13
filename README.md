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
Shutdown WSL and reboot. Login again and run ./settingup3.sh

Extra:
openwrt build essential
```
sudo pacman -S --needed base-devel autoconf automake bash binutils bison \
bzip2 fakeroot file findutils flex gawk gcc gettext git grep groff \
gzip libelf libtool libxslt m4 make ncurses openssl patch pkgconf \
python rsync sed texinfo time unzip util-linux wget which zlib \
asciidoc help2man intltool perl-extutils-makemaker swig pam xz net-snmp\

```
