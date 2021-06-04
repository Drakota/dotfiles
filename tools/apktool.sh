#!/bin/bash
DIR="$(dirname "$0")"
source $DIR/../utils.sh

TOOL_NAME="apktool"
APKTOOL_RELEASE_URL="https://github.com/iBotPeaches/Apktool/releases/download/v2.5.0/apktool_2.5.0.jar"
INSTALL_PATH=$HOME/.local/bin

preinstall_hook() { :; }

install_hook() {
	wget -q --show-progress $APKTOOL_RELEASE_URL -O $INSTALL_PATH/apktool.jar
	echo "[*] Adding apktool alias"
	echo -e "alias apktool='java -jar $INSTALL_PATH/apktool.jar'" >> $HOME/.bash_aliases
	source $HOME/.bashrc
}

postinstall_hook() { :; }

setup_tool preinstall_hook install_hook postinstall_hook