#!/usr/bin/zsh

sleep 1
echo password | sudo -v -S
sudo rm -f /var/lib/pacman/db.lck
echo "\n"
echo "\033[31m[System upgrade]\033[0m"
sudo pacman -Syyu --noconfirm

echo "\033[31m[Clear up]\033[0m"
sudo pacman -Scc --noconfirm

orphaned_list=$(pacman -Qdqt)
if [[ -v ${orphaned_list} ]] {
	echo "No orphaned package"
} else {
	sudo pacman -Rsn ${orphaned_list} --noconfirm
}
