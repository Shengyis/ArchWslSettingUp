#!/usr/bin/zsh

orphaned_list=$(pacman -Qdqt)
if [ ! ${orphaned_list} ]
then
	echo "No orphaned package"
else
	sudo pacman -Rsn ${orphaned_list} --noconfirm
fi
