#!/bin/bash
DIR="$(dirname "$0")"
source $DIR/../../utils.sh

LOCAL_BIN_PATH="# add local bin to path to access pip tools
export PATH=\$HOME/.local/bin:\$PATH"

if [ -f "$HOME/.bashrc" ]; then
	check_if_configuration_exists "$LOCAL_BIN_PATH" "$HOME/.bashrc"
	printf "\n$LOCAL_BIN_PATH\n" >> $HOME/.bashrc
fi

if [ -f "$HOME/.zshrc" ]; then
	check_if_configuration_exists "$LOCAL_BIN_PATH" "$HOME/.zshrc"
	printf "\n$LOCAL_BIN_PATH\n" >> $HOME/.zshrc
fi

echo "[+] Added local bin to path"
