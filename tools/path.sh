#!/bin/bash

LOCAL_BIN_PATH="# add local bin to path to access pip tools
export PATH=\$HOME/.local/bin:\$PATH"

if [ -f "$HOME/.bashrc" ]; then
	echo "$LOCAL_BIN_PATH" >> $HOME/.bashrc
fi

if [ -f "$HOME/.zshrc" ]; then
	echo "$LOCAL_BIN_PATH" >> $HOME/.zshrc
fi

echo "[+] Added local bin to path"
