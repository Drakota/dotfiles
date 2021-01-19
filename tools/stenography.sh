#!/bin/bash
DIR="$(dirname "$0")"
source $DIR/../utils.sh

TOOL_NAME="stenography tools"
INSTALL_PATH=$HOME/.local/bin
DISTRIBUTION_ID="$(lsb_release -i)"

preinstall_hook() { :; }

install_hook() {
	if [[ $DISTRIBUTION_ID =~ "Kali" ]]; then
		sudo apt update && sudo apt install exiftool steghide
	fi
	wget "http://www.caesum.com/handbook/Stegsolve.jar" -O $INSTALL_PATH/stegsolve.jar
	echo "[*] Adding stegsolve alias"
	echo -e "alias stegsolve='java -jar $INSTALL_PATH/stegsolve.jar'" >> $HOME/.bash_aliases
	source $HOME/.bashrc
}

postinstall_hook() { :; }

setup_tool preinstall_hook install_hook postinstall_hook