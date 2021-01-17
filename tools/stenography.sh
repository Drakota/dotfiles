#!/bin/bash

TOOL_NAME="stenography tools"
INSTALL_PATH=$HOME/.local/bin
echo "[*] Installing $TOOL_NAME"

DISTRIBUTION_ID="$(lsb_release -i)"
if [[ $DISTRIBUTION_ID =~ "Kali" ]]; then
	sudo apt update && sudo apt install exiftool steghide
fi

wget "http://www.caesum.com/handbook/Stegsolve.jar" -O $INSTALL_PATH/stegsolve.jar
echo "[*] Adding stegsolve alias"
echo -e "alias stegsolve='java -jar $INSTALL_PATH/stegsolve.jar'" >> $HOME/.bash_aliases
source $HOME/.bashrc

echo "[+] $TOOL_NAME successfully installed"
