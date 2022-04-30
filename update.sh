#!/usr/bin/zsh

echo "\033[31m[System upgrade]\033[0m"
echo chinasky | sudo -S pacman -Syyu --noconfirm

echo "\033[31m[Distrod update]\033[0m"
sudo ${HOME}/.distrod_install.sh update

echo "\033[31m[Clear up]\033[0m"
sudo pacman -Scc --noconfirm

orphaned_list=$(pacman -Qdqt)
if [ ! ${orphaned_list} ]
then
	echo "No orphaned package"
else
	sudo pacman -Rsn ${orphaned_list} --noconfirm
fi
