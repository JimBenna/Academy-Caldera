#!/bin/bash
clear
while true; do
read -p "This script prepare the working environment.
Are you sure you want to do that ? (y/n) ?"  yn
		case $yn in
		[yY]* ) mkdir ~/caldera/data/abilities >/dev/null 2>&1;
			cp -r ~/repo/abilities ~/caldera/data >/dev/null 2>&1;
			mkdir ~/caldera/data/adversaries >/dev/null 2>&1;
			cp -r ~/repo/adversaries ~/caldera/data >/dev/null 2>&1;
			echo "\e[35mAll is now ready to launch a \e[32mfunny game \e[1;36m;-)\e[0;37m";
			break;; 
		[nN]* ) echo "Cancelled"; exit ;;
		* ) clear; echo; echo "Invalid choice, select yes or no";;
esac
done

