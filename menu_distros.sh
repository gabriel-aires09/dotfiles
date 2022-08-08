#!/bin/env bash

selectDistro () {
	while true; do
		clear
		echo "Choose your distribution: 

		1. Debian
		2. Void
		3. ArchLinux
		4. Ubuntu
		0. Close program
		"
		read -p "Enter Selection [0-9] --> "
		case "$REPLY" in
			0) echo "Goodbye"
				break
				;;
			1) echo "Debian" 
				./debian-dot.sh
				;;
			2) echo "Void"
				./void.sh
				;;
			3) echo "ArchBTW"
				./archlinux.sh
				;;
			4) echo "Ubuntu"
				./ubuntu-desktop.sh
				;;
			*) echo "Invalid entry" >&2
				;;
		esac
	done
}

selectDistro

