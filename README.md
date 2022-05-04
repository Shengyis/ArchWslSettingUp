1. Let systemd work in wsl2 archlinux
```
curl -L -O "https://raw.githubusercontent.com/nullpo-head/wsl-distrod/main/install.sh"
chmod +x install.sh
./install.sh install
./install.sh update
/opt/distrod/bin/distrod enable
```
2. Update arch and install vim, sudo, git, wget, system fonts
```
pacman-key --init
pacman-key --populate archlinux
pacman -Syu vim sudo git wget adobe-source-sans-fonts --noconfirm
```
3. Add loot password and user and other setting
```
passwd
useradd -m -G wheel <username>
passwd shengyis
export EDITOR=/bin/vim
visudo /etc/sudoers       #uncomment wheel group
mkdir /usr/lib/wsl/lib2
ln -s /mnt/c/Windows/System32/lxss/lib/* /usr/lib/wsl/lib2
vim /etc/wsl.conf
# add following 
[user]
default=<username>
[automount]
ldconfig=false

vim /etc/ld.so.conf.d/ld.wsl.conf   #change /usr/lib/wsl/lib to /usr/lib/wsl/lib2

mv /root/install.sh /home/shengyis/.distrod_install.sh

# terminate arch and reboot
sudo /opt/distrod/bin/distrod enable
# terminate arch and reboot
sudo pacman -Scc --noconfirm
sudo pacman -Rns $(pacman -Qtdq) --noconfirm
```
4. Install zsh and Oh My Zsh
```
sudo pacman -S zsh --noconfirm
sudo -s
chsh -s /bin/zsh root
chsh -s /usr/bin/zsh <usrname>

# reboot
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
5. setting .zshrc and .vimrc
```
chmod +x .update.sh

vim .zshrc

# some alias
alias lsx='ls -X'
alias update="${HOME}/.update.sh"

# g++ include path
PY_VER=3.10
NUMPY_INCLUDE_PATH="/usr/lib/python${PY_VER}/site-packages/numpy/core/include/"
export CPLUS_INCLUDE_PATH="/usr/include/python${PY_VER}/:${NUMPY_INCLUDE_PATH}:/usr/include/eigen3/:/usr/include/suitesparse/"

# default omp threads
export OMP_NUM_THREADS=8

# zsh theme setting
ZSH_THEME="avit"
```
6. install packages
```
sudo pacman -S openblas eigen fftw gcc boost suitesparse python tk python-matplotlib python-scipy python-mpmath adobe-source-code-pro-fonts texlive-most --noconfirm
```
