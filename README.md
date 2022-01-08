set up Ubuntu on wsl2:

1. remove snapd and upgrade to newest version
```
sudo vim /etc/update-manager/release-upgrades
change Prompt=normal -> Prompt=normal
remove snapd
sudo do-release-upgrade
```
2. install zsh
```
sudo apt install zsh
```
4. install oh-my-zsh
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
```
6. install packages
```
sudo apt install libopenblas-openmp-dev
sudo apt install g++ libeigen3-dev libfftw3-dev libboost-all-dev 
sudo apt install python-dev-is-python3 python3-matplotlib python3-scipy pylint libsuitesparse-dev
sudo apt install texlive-full
```
7. system setting in "~/.zshrc"
```
# some alias
alias lsx='ls -X'
alias update="sudo apt update && sudo apt dist-upgrade -y && sudo apt autoclean && sudo apt autoremove -y"

# g++ include path
export CPLUS_INCLUDE_PATH="/usr/include/python3.9/:/usr/include/eigen3/:/usr/include/suitesparse/"

# default omp threads
export OMP_NUM_THREADS=8
	
# Xsever config, no need for latest version of wsl 2 in win11
# export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0
```
