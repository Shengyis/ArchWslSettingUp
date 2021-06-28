set up Ubuntu on wsl2:

1. install zsh, oh-my-zsh 
2. install powerline theme
```
git clone https://github.com/jeremyFreeAgent/oh-my-zsh-powerline-theme.git
```
3. install powerline fonts on windows side 
```
git clone https://github.com/powerline/fonts.git
```
4. install packages
```
sudo apt install g++ libeigen3-dev libfftw3-dev libopenblas-openmp-dev libboost-all-dev python-dev-is-python3 python3-pip python3-tk
pip3 install numpy matplotlib scipy tkinter
```
6. set c++ include path and xserver config in "~/.zshrc"
```
# g++ include path
export CPLUS_INCLUDE_PATH="/usr/include/python3.9/"
	
# Xsever config
export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0
```
