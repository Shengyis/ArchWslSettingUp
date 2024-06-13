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
if [[ -n "${orphaned_list}" ]] {
	sudo pacman -Qdqt | sudo -Rsn --noconfirm -
} else {
	echo "No orphaned package"
}
