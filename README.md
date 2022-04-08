install Ubuntu on wsl2:

1. setting up and upgrade to newest version
```
apt update
apt install locales dialog apt-utils vim
locale-gen en_US.UTF-8
update-locale LANG=en_US.UTF-8
vim /sbin/policy-rc.d

change exit 101 -> exit 0

vim /root/.bashrc

add export RUNLEVEL=5

source /root/.bashrc
apt reinstall locales dialog apt-utils vim

apt install sudo curl wget git update-manager-core rsync
adduser <username>
usermod -aG sudo <username>
vim /etc/wsl.conf

[user]
default=<username>

vim /etc/update-manager/release-upgrades
check Prompt=normal -> Prompt=normal

exit and at powershell side
wsl --terminate Ubuntu

sudo do-release-upgrade
```
2. install zsh and set it as defaut shell
```
sudo apt install zsh
sudo -s
chsh -s /bin/zsh root
chsh -s /usr/bin/zsh <usrname>
```
3. install oh-my-zsh
```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
4. install packages
```
sudo apt install build-essential
sudo apt install libopenblas-openmp-dev
sudo apt install libeigen3-dev libfftw3-dev libboost-all-dev libsuitesparse-dev
sudo apt install python3-matplotlib python3-scipy python3-mpmath
sudo apt install texlive-full
```
5. system setting in "~/.zshrc"
```
# set runlevel
export RUNLEVEL=5

# some alias
alias lsx='ls -X'
alias update="sudo apt update && sudo apt full-upgrade -y && sudo apt autoclean && sudo apt autoremove -y"

# g++ include path
export CPLUS_INCLUDE_PATH="/usr/include/python3.9/:/usr/include/eigen3/:/usr/include/suitesparse/"

# default omp threads
export OMP_NUM_THREADS=8

# zsh theme setting
ZSH_THEME="amuse"
```
