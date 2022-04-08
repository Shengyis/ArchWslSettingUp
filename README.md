install Ubuntu on wsl2:

1. setting up and upgrade to newest version
```
apt update
apt install sudo curl wget git vim update-manager
adduser <username>
usermod -aG sudo <username>
vim /etc/wsl.conf

[user]
default=<username>

vim /etc/update-manager/release-upgrades
check Prompt=normal -> Prompt=normal

exit and at powershell side
wsl --terminate Ubuntu

touch ~/.sudo_as_admin_successful
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
4. install powerline theme
```
git clone https://github.com/jeremyFreeAgent/oh-my-zsh-powerline-theme.git
```
5. install powerline fonts on windows side 
```
git clone https://github.com/powerline/fonts.git
change windows terminal font to powerline type font
```
6. install packages
```
sudo apt install build-essential
sudo apt install libopenblas-openmp-dev
sudo apt install libeigen3-dev libfftw3-dev libboost-all-dev libsuitesparse-dev
sudo apt install python3-matplotlib python3-scipy python3-mpmath
sudo apt install texlive-full
```
7. system setting in "~/.zshrc"
```
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
