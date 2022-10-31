#!/usr/bin/zsh

sleep 1
echo password | sudo -v -S
echo "\n"

echo "\033[31m[System upgrade]\033[0m"
pacman -Syyu --noconfirm

echo "\033[31m[Clear up]\033[0m"
pacman -Scc --noconfirm

orphaned_list=$(pacman -Qdqt)
if [[ !${orphaned_list} ]] {
	echo "No orphaned package"
} else {
	pacman -Rsn ${orphaned_list} --noconfirm
}
