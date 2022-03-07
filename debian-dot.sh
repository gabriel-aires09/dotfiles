#!/bin/env bash

ubuntu_menu () {
	while true; do
		clear
		echo 
		"
		What do you want to do?
		1. Install everything
		2. Update and upgrade distro
		3. Install and configure PPAS
		4. Install Hack Nerd Font
		5. Install Flat-Remix-Gtk and Icons
		6. Install common apps
		7. Install Vundle/vim
		8. Change shell bash to zsh
		9. Install dotfiles (.zshrc and .vimrc)
		10. Install lsd (next gen ls)
		0. Do nothing and go back to main menu
		"
		read -p "Enter Selection [0-8] > "
		case "$REPLY" in
			0) echo "Going back..."
				break
			;;
		  1) echo "Now it's the really chad talk!"
				ubuntu_all
				;;
			2) echo "Updating..."
				apt update && apt upgrade
				;;
			3) echo "Installing PPAs"
				add-apt-repository ppa:daniruiz/flat-remix
				;;
			4) echo "Installing Hack Nerd Font..."
				wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip			
				mkdir Hack ; mv Hack.zip Hack
				cd Hack && unzip Hack.zip 
				cd .. 
				sudo mv Hack /usr/share/fonts
				fc-cache -fv
			;;
		  5) echo "Installing Flat-remix gtk and icons"
				apt update
				apt install flat-remix-gtk
				apt install flat-remix
				;;
			6) echo "Installing common apps.."
				programs_install
				;;
			7) echo "Installing Vundle/Vim..."
				git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
				;;
			8) echo "Changing shell, please type your password "
				chsh -s $(which zsh)
				;;
			9) echo "Configuring dotfiles..."
				cp .vimrc .zshrc $HOME
				;;
			10) echo "Download and installing lsd (ls next gen command)"
				wget https://github.com/Peltoche/lsd/releases/download/0.20.1/lsd_0.20.1_amd64.deb
				dpkg -i lsd_0.20.1_amd64.deb
				;;
			*) echo "Invalid entry" >&2
				;;
		esac
	done
}

programs_install () {
	PROGRAMS_INSTALL=(
		tilix
		zsh
		zsh-autosuggestions
		zsh-syntax-highlighting
		neofetch
		htop
		build-essential
		vim
		obs-studio
		git
		wget
		curl
		vim
		gnome-tweaks
	)

	for name_of_program in ${PROGRAMS_INSTALL[@]}; do
		if ! dpkg -l | grep -q $name_of_program; then
			apt install "$name_of_program"
		else
			echo "[Already installed]" - $name_of_program
		fi
	done
}

ubuntu_all () {
	# Update and upgrade
	apt update && apt upgrade

	# Adding PPAS
	add-apt-repository ppa:daniruiz/flat-remix

	# Installing Hack Nerd Font
	wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip
	mkdir Hack ; mv 
	Hack.zip Hack
	cd Hack && unzip Hack.zip
	cd .. && sudo mv Hack /usr/share/fonts
	fc-cache -fv

	# Flat-Remix
	apt update
	apt install flat-remix-gtk
	apt install flat-remix

	# Common apps
	programs_install

	# Vundle 
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

	# Changing shell 
	chsh -s $(which zsh)

}

ubuntu_menu

# Display link tweaks 
# Here: https://blog.mgor.net/2017/01/26/hp-displaylink-docking-station-in-ubuntu/















