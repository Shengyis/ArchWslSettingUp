set up Ubuntu on wsl2:

1. install zsh, oh-my-zsh 
2. install powerline theme
	https://github.com/jeremyFreeAgent/oh-my-zsh-powerline-theme.git
3. install powerline fonts on windows side 
	https://github.com/powerline/fonts.git
4. install g++, libeigen3-dev, libfftw3-dev, libopenblas-openmp-dev, libboost-all-dev, python-dev-is-python3
5. set c++ include path and xserver config in "~/.profile"
	'''
	# g++ include path
	export CPLUS_INCLUDE_PATH="/usr/include/python3.8/:/usr/local/include/cxsc/"
	
	# Xsever config
	export DISPLAY=$(awk '/nameserver / {print $2; exit}' /etc/resolv.conf 2>/dev/null):0
	'''
