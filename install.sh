#!/bin/bash

if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    echo "Drakota's dotfiles - https://github.com/Drakota/dotfiles
Usage: $(basename "$0") [options]
Options:
    -h, --help      Print this help text
    --with-tools    Install all tools"
    exit
fi

for filename in .* *; do
    if [[ ! $filename =~ ^(.git|tools|README.md|install.sh|.|..)$ ]]; then
        ln -sfn $PWD/$filename $HOME/$filename
        echo "[*] Symlinked $filename"
    fi
done

if [[ "$1" == "--with-tools" ]]; then
	for filename in tools/*; do
		$filename
	done
fi

echo "[+] Dotfiles installed"
