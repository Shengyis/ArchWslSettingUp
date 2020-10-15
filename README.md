This is a collection of some useful repos for scientific computing and their install details as well as some software configuration files back up for Mac and Linux both).

pre install list:

	gcc, git, make, cmake, python

Repos list:

oh-my-zsh-powerline-theme: oh-my-zsh Powerline style Theme

	https://github.com/jeremyFreeAgent/oh-my-zsh-powerline-theme.git
	--------------------------------------------------
	run install_in_omz.sh
	--------------------------------------------------

Powerline fonts: a collection of powerline fonts

	https://github.com/powerline/fonts.git
	--------------------------------------------------
	run install.sh
	--------------------------------------------------

OpenBLAS: an optimized BLAS library
	
	https://github.com:xianyi/OpenBLAS.git
	--------------------------------------------------
	make USE_OPENMP=1 NUM_PARALLEL=2
	make PREFIX=/usr/local installGenerating openblas_config.h in /usr/local/include
	--------------------------------------------------
	Generating f77blas.h in /usr/local/include
	Generating cblas.h in /usr/local/include
	Copying LAPACKE header files to /usr/local/include
	Copying the static library to /usr/local/lib
	Copying the shared library to /usr/local/lib
	Generating openblas.pc in /usr/local/lib/pkgconfig
	Generating OpenBLASConfig.cmake in /usr/local/lib/cmake/openblas
	Generating OpenBLASConfigVersion.cmake in /usr/local/lib/cmake/openblas
	--------------------------------------------------

Eigen: C++ template library for linear algebra
	
	https://gitlab.com/libeigen/eigen.git
	
