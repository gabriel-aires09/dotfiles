#!/bin/bash

clear
echo "Please select:
1. Install everything
2. Update and upgrade distro
3. Install common aps
4. Install Vundle/vim
5. Change shell bash to zsh
6. Move dotfiles to HOME
0. Do nothing and exit program
"
void_menu () {
	read -p "Enter Selection [0-6] > "
	case "$REPLY" in
		0) echo "Going back..."
			break
			;;
		1) echo "Its now time to install everything"
			void_linux
			;;
		2) echo "Making the necessary updates..."
			xbps-install xbps -u
			xbps-install -Suv
			;;
		3) echo "Now it is time to install the apps..."
			programs
			# sudo xbps-install -S zsh zsh-autosuggestions zsh-syntax-highlighting neofetch htop bpytop vim git wget curl lsd alacritty obs-studio xdg-user-dirs bspwm unzip xz 
			;;
		4) echo "Installing Vundle"
			git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
			;;
		5) echo "Changin shell to zsh"
			chsh -s $(which zsh)
			;;
		6) echo "Moving dotfiles to Home"
			cp .vimrc .alacritty.yml .zshrc ~/
			;;
		*) echo "Invalid entry" >&2
			exit 1
			;;
	esac
}

void_linux () {
	
	# Update and upgrade everything
	xbps-install xbps -u
	xbps-install -Suv

	# script to check if the programs are already installed into the system
	PROGRAMS_INSTALL=(
		zsh
		zsh-autosuggestions
		zsh-syntax-highlighting
		neofetch
		htop
		bpytop
		vim
		git
		wget
		curl
		lsd
		alacritty
		obs-studio
		xdg-user-dirs
		bspwm
		unzip
		rofi
		xz
	)

	for name_of_program in ${PROGRAMS_INSTALL[@]}; do
		if ! xbps-query -l | awk '{ print $2 }' | grep -q $name_of_program; then
			xbps-install -S "$name_of_program"

		else
			echo "[Already installed]" - $name_of_program
		fi
	done

	# Vundle
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

	# Changing shell
	chsh -s $(which zsh)

	# Dotfiles
	cp .vimrc .alacritty.yml .zshrc ~/

}

programs () {

	PROGRAMS_INSTALL=(
		zsh
		zsh-autosuggestions
		zsh-syntax-highlight
		neofetch
		htop
		bpytop
		vim
		git
		wget
		curl
		lsd
		alacritty
		xdg-user-dirs
		bspwm
		unzip
		rofi
		xz
	)

	for name_of_program in ${PROGRAMS_INSTALL[@]}; do
		if ! xbps-query -l | awk '{ print $2 }' | grep -q $name_of_program; then
			xbps-install -S "$name_of_program"
		else
			echo "[Already installed]" - $name_of_program
		fi
	done
}

# calling the menu function
void_menu














