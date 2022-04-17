install Ubuntu on wsl2:

0. setting proxy
```
wsl_server=$(cat \/etc\/resolv.conf | grep nameserver | awk '{print $2}')":7890"
export https_proxy='http://${wsl_server}' && export http_proxy='http://${wsl_server}' && export all_proxy='sock5://${wsl_server}'

```
1. setting up and upgrade to newest version
```
apt update
apt install locales dialog apt-utils libpam-systemd vim man-db -y
locale-gen en_US.UTF-8
update-locale LANG=en_US.UTF-8
vim /sbin/policy-rc.d

change exit 101 -> exit 0

export RUNLEVEL=5
apt reinstall locales dialog apt-utils libpam-systemd vim man-db -y
dpkg-reconfigure locales dialog apt-utils libpam-systemd vim man-db
unminimize -y

apt install sudo curl wget git update-manager-core lsb_core net-tools -y

vim /etc/update-manager/release-upgrades
check Prompt=normal -> Prompt=normal

adduser <username>
usermod -aG sudo <username>
mkdir /usr/lib/wsl/lib2
ln -s /mnt/c/Windows/System32/lxss/lib/* /usr/lib/wsl/lib2

vim /etc/wsl.conf

[user]
default=<username>
[automount]
ldconfig=false

vim /etc/ld.so.conf.d/ld.wsl.conf
/usr/lib/wsl/lib -> /usr/lib/wsl/lib2

exit and at powershell side
wsl --terminate Ubuntu

sudo do-release-upgrade
```
2. install zsh and set it as defaut shell
```
sudo apt install zsh -y
sudo -s
chsh -s /bin/zsh root
chsh -s /usr/bin/zsh <usrname>
```
3. install oh-my-zsh
```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
4. system setting in "~/.zshrc" and "/root/.zshrc"
```
# set runlevel
export RUNLEVEL=5

# some alias
alias lsx='ls -X'
alias update="sudo apt update && sudo apt full-upgrade -y && sudo apt autoclean && sudo apt autoremove -y"

# set / unset proxy through windows proxy
wsl_server=$(cat \/etc\/resolv.conf | grep nameserver | awk '{print $2}')":7890"
alias setp="export https_proxy='http://${wsl_server}' && export http_proxy='http://${wsl_server}' && export all_proxy='sock5://${wsl_server}'"
alias unsetp="unset https_proxy && unset http_proxy && unset all_proxy"

# g++ include path
export CPLUS_INCLUDE_PATH="/usr/include/python3.9/:/usr/include/eigen3/:/usr/include/suitesparse/"

# default omp threads
export OMP_NUM_THREADS=8

# zsh theme setting
ZSH_THEME="amuse"
```
5. install packages
```
sudo apt install g++ -y
sudo apt install libopenblas-openmp-dev -y
sudo apt install libeigen3-dev libfftw3-dev libboost-all-dev libsuitesparse-dev -y
sudo apt install python3-matplotlib python3-scipy python3-mpmath -y
sudo apt install texlive-full -y
```
