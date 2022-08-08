#!/bin/env bash

# Variables
 

menu_ubuntu () {
	while true; do
		clear
		echo "What do you want to do?
		1. Install everthing
		2. Install and configure intel-undervolt
		3. Install essential apps and adjust time
		4. Install myLibreGaming
		5. Install ls nextgen pls
		6. Copy dotfiles
		7. Download and launch unsnap
		8. Configure Flatpak and Flathub
		9. Install and configure bpytop
		0. Do nothing and close the program
		"
		read -p "Enter Selection [0-9] > "
		case "$REPLY" in
			0) echo "Bye Bye!"
				break
				;;
			1) echo "Installing everthing"
				everthing_ubuntu
				;;
			2) echo "Configuring intel-undervolt.."
				git clone https://github.com/kitsunyan/intel-undervolt.git ; cd intel-undervolt
				./configure --enable-systemd ; make ; make install 
				systemctl enable intel-undervolt.service
				systemctl status intel-undervolt.service
				;;
			3) echo "Installing essential apps"
				apt update && apt upgrade 
				apt install build-essential git wget curl vim dconf-cli piper python3-pip htop neofetch obs-studio gnome-boxes -y
				timedatectl set-local-rtc 1
				;;
			4) echo "My libreGaming... POGGERS"
				dpkg --add-architecture i386
				wget -nc https://dl.winehq.org/wine-builds/winehq.key
				apt-key add winehq.key
				add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main'
				apt update 
				apt install --install-recommends winehq-staging
				dpkg --add-architecture i386 && apt update && apt install -y wine64 wine32 libasound2-plugins:i386 libsdl2-2.0-0:i386 libdbus-1-3:i386 libsqlite3-0:i386
				add-apt-repository ppa:lutris-team/lutris
				add-apt-repository ppa:flexiondotorg/mangohud
				apt install lutris mangohud goverlay
				;;
			5) echo "Installing ls"
				wget https://github.com/Peltoche/lsd/releases/download/0.20.1/lsd_0.20.1_amd64.deb
				dpkg -i lsd_0.20.1_amd64.deb
				;;
			6) echo "Copying the most infamous dotfiles"
				# cp -v .alacritty.yml .vimrc .zshrc $MY_HOME
				cp .vimrc .bashrc .zshrc
				;;


			7) echo "Download and launch unsnap"
				git clone https://github.com/popey/unsnap.git ; cd unsnap ; ./unsnap auto
				;;
			8) echo "Configure and install Flatpak and Flathub programs"
				apt install flatpak gnome-software-plugin-flatpak -y
				flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
				flatpak update
        flatpak install flathub com.spotify.Client
        flatpak install flathub com.discordapp.Discord
        flatpak install flathub net.davidotek.pupgui2
        flatpak install com.valvesoftware.Steam
				;;
			9) echo "Installing bpytop"
				apt install python3-pip
				pip3 install bpytop --upgrade
				;;
			*) echo "Invalid entry" >&2
				;;
		esac
	done
}


everthing_ubuntu () {
	# Update everthing before install apps
	apt update && apt update

	# WINE
	dpkg --add-architecture i386
	wget -nc https://dl.winehq.org/wine-builds/winehq.key
	apt-key add winehq.key
	add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main'
	apt update 
	apt install --install-recommends winehq-staging
	dpkg --add-architecture i386 && apt update && apt install -y wine64 wine32 libasound2-plugins:i386 libsdl2-2.0-0:i386 libdbus-1-3:i386 libsqlite3-0:i386

	# PPAS
	add-apt-repository ppa:lutris-team/lutris
	add-apt-repository ppa:flexiondotorg/mangohud


	# APT
	apt update ; apt upgrade 
	apt install build-essential git wget vim dconf-cli piper lutris mangohud goverlay gamemode python3-pip htop neofetch obs-studio -y

	# bpytop and don't forget to set PATH location where the bpytop is located, using bashrc or zshrc
	pip3 install bpytop --upgrade

	# Unsnap
	 git clone https://github.com/popey/unsnap.git
   bash ~/dotfiles/unsnap/unsnap auto

	# flatPak
	apt install flatpak gnome-software-plugin-flatpak -y
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
	flatpak update
	flatpak install flathub com.spotify.Client
	flatpak install flathub com.discordapp.Discord
	flatpak install flathub net.davidotek.pupgui2
	flatpak install com.valvesoftware.Steam

	# intelUndervolt
	git clone https://github.com/kitsunyan/intel-undervolt.git ; cd intel-undervolt
	./configure --enable-systemd ; make ; make install

	# systemctl undervolt
	systemctl enable intel-undervolt.service
	systemctl start intel-undervolt.service

	# dotFiles
	bash move_dotfiles.sh

	# LS
	wget https://github.com/Peltoche/lsd/releases/download/0.20.1/lsd_0.20.1_amd64.deb
	dpkg -i lsd_0.20.1_amd64.deb

	# Vundle vim
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

	# Obs: If you need to use Nvidia-on-demand, do this
	# vim /etc/environment 
	# add this lines __NV_PRIME_RENDER_OFFLOAD=1 (VULKAN)  and __GLX_VENDOR_LIBRARY_NAME=nvidia (OPENGL)
	# You can use these envs in some steam games
	# Don't forget to install nvidia-drivers first
	# MORE INFO ABOUT THE PRIME-OFFLOAD --> https://askubuntu.com/questions/1201072/how-nvidia-on-demand-option-works-in-nvidia-x-server-settings
	
	# Remember to use symlink to change image directory from gnome-boxes. Like this ln -s [where you moved it your directory] ~/.local/share/gnome-boxes/images/[specific image]

}

menu_ubuntu



