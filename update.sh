#!/usr/bin/zsh

sleep 2
echo -n "Check updates? [Y/N] "
read input

case ${input} in
	[yY][eE][sS]|[yY])

		echo chinasky | sudo -v -S
		echo "\n"
		echo "\033[31m[System upgrade]\033[0m"
		yay -Syyu --noconfirm

		echo "\033[31m[Distrod update]\033[0m"
		sudo ${HOME}/.distrod_install.sh update

		echo "\033[31m[Clear up]\033[0m"
		yay -Scc --noconfirm

		orphaned_list=$(pacman -Qdqt)
		if [ ! ${orphaned_list} ]
		then
			echo "No orphaned package"
		else
			yay -Rsn ${orphaned_list} --noconfirm
		fi
		;;

	[nN][oO]|[nN])
		;;
	
	*)
		echo "Invalid input"
		;;
esac
