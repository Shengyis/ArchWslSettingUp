#!/usr/bin/zsh

sleep 1
echo chinasky | sudo -v -S
echo "\n"
echo "\033[31m[System upgrade]\033[0m"
yay -Syyu --noconfirm

echo "\033[31m[Distrod update]\033[0m"
sudo ${HOME}/.distrod_install.sh update

echo "\033[31m[Clear up]\033[0m"
yay -Scc --noconfirm

orphaned_list=$(pacman -Qdqt)
if [[ !${orphaned_list} ]] {
	echo "No orphaned package"
} else {
	yay -Rsn ${orphaned_list} --noconfirm
}
