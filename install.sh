#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    echo "Drakota's dotfiles - https://github.com/Drakota/dotfiles
Usage: $(basename "$0") [options]
Options:
    -h, --help      Print this help text
    --with-tools    Install common tools
    --with-all-tools    Install common and sec tools"
    exit
fi

for filepath in $DIR/.* $DIR/*; do
    filename=$(basename $filepath)
    if [[ ! $filename =~ ^(.git|tools|README.md|install.sh|utils.sh|.|..)$ ]]; then
        ln -sfn $DIR/$filename $HOME/$filename
        echo "[*] Symlinked $filename to $HOME/$filename"
    fi
done

if [[ "$1" == "--with-tools" ]]; then
	for filename in $DIR/tools/common/*; do
		$filename
	done
    echo "[*] You may have to reload your current shell to have access to the installed tools"
fi

if [[ "$1" == "--with-all-tools" ]]; then
	for filename in $DIR/tools/*/**; do
		$filename
	done
    echo "[*] You may have to reload your current shell to have access to the installed tools"
fi

echo "[+] Dotfiles installed"
