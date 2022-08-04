#!/bin/bash
clear
while true; do
read -p "This script prepare the working environment.
Are you sure you want to do that ? (y/n) ?"  yn
		case $yn in
		[yY]* ) echo "Ready to go"; 
			mkdir ~/caldera/data/abilities &>/dev/null;
			cp -r ~/repo/abilities ~/caldera/data;
			mkdir ~/caldera/data/adversaries &>/dev/null;
			cp -r ~/repo/adversaries ~/caldera/data;
			break;; 
		[nN]* ) echo "Cancelled"; exit ;;
		* ) clear; echo; echo "Invalid choice, select yes or no";;
esac
done
