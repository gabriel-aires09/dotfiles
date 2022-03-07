#!/bin/env bash

# VARIABLES
PACKAGES="zsh zsh-autosuggestions zsh-syntax-highlighting neofetch htop bpytop vim git wget curl lsd alacritty obs xdg-user-dirs bspwm unzip xz git opendoas zsh zsh-autosuggestions zsh-syntax-highlighting neofetch papirus-icon-theme nitrogen rofi autorandr neovim lxappearance alsa-utils neovim pavucontrol" 
DWM="dwm base-devel libX11-devel libXft-devel libXinerama-devel freetype-devel fontconfig-devel"
VUNDLE="https://github.com/gmarik/Vundle.vim.git"

void_menu () {
	while true;do
		clear
		echo "Please select:
		1. Install everything
		2. Update and upgrade distro
		3. Install common aps
		4. Install Vundle/vim
		5. Change shell bash to zsh
		6. Move dotfiles to HOME
		7. Install JetBrainsMono Nerd Fonts
		8. Install DWM
		0. Do nothing and exit program
		"
		read -p "Enter Selection [0-6] > "
		case "$REPLY" in
			0) echo "Going back..."
				break
				;;
			1) echo "Its now time to install everything"
				void_linux
				;;
			2) echo "Making the necessary updates..."
				#xbps-install xbps -u
				xbps-install -Suv
				;;
			3) echo "Now it is time to install the apps..."
				$PROGRAMS
				;;
			4) echo "Installing Vundle"
				git clone $VUNDLE
				cp .vim ~/
				;;
			5) echo "Changin shell to zsh"
				chsh -s $(which zsh)
				;;
			6) echo "Moving dotfiles to Home and .config"
				cp .vimrc .alacritty.yml .zshrc ~/
				cp rofi picom.conf ~/.config
				;;
			7) echo "Install JetBrains Nerd Fonts"
				cp -r JetBrainsMono /usr/share/fonts
				fc-cache -fv
				;;
			8) echo "Installing DWM and dependencies"
				xbps-install -S $DWM
				*) echo "Invalid entry" >&2
				exit 1
				;;
		esac
	done
}

void_linux () {
	
	# Update and upgrade everything
	#xbps-install xbps -u
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
		obs
		xdg-user-dirs
		bspwm
		unzip
		rofi
		xz
		git
		opendoas 
		zsh 
		zsh-autosuggestions 
		zsh-syntax-highlighting 
		neofetch papirus-icon-theme 
		nitrogen 
		rofi 
		autorandr 
		neovim 
		lxappearance 
		alsa-utils 
		neovim 
		pavucontrol
	)
	
	#font: https://github.com/Diolinux/Linux-Mint-19.x-PosInstall
	for name_of_program in ${PROGRAMS_INSTALL[@]}; do
		if ! xbps-query -l | awk '{ print $2 }' | grep -q $name_of_program; then
			xbps-install -S "$name_of_program"

		else
			echo "[Already installed]" - $name_of_program
		fi
	done

	# Vundle
	git clone $VUNDLE
	cp .vim ~/

	# Changing shell
	chsh -s $(which zsh)

	# Dotfiles
	cp .vimrc .alacritty.yml .zshrc ~/

}

# calling the menu function
void_menu














