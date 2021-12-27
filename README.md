set up Ubuntu on wsl2:

1. install zsh
2. install oh-my-zsh
```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
3. install powerline theme
```
git clone https://github.com/jeremyFreeAgent/oh-my-zsh-powerline-theme.git
```
4. install powerline fonts on windows side 
```
git clone https://github.com/powerline/fonts.git
```
5. install packages
```
sudo apt install g++ libeigen3-dev libfftw3-dev libopenblas-openmp-dev libboost-all-dev 
sudo apt install python-dev-is-python3 python3-matplotlib python3-scipy pylint libsuitesparse-dev
```
6. system setting in "~/.zshrc"
```
# some alias
alias lsx='ls -X'
alias update="sudo apt update && sudo apt dist-upgrade -y && sudo apt autoclean && sudo apt autoremove -y"

# g++ include path
export CPLUS_INCLUDE_PATH="/usr/include/python3.9/:/usr/include/eigen3/:/usr/include/suitesparse/"

# default omp threads
export OMP_NUM_THREADS=8
	
# Xsever config
export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0
```
7. remove snapd and upgrade to newest version
