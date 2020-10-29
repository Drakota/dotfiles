#!/bin/bash

for filename in .* *; do
    if [[ ! $filename =~ ^(.git|README.md|install.sh|.|..)$ ]]; then
        ln -sfn $PWD/$filename ~/$filename
        echo "[*] Symlinked $filename"
    fi
done

echo "[+] Dotfiles installed"