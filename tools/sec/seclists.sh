#!/bin/bash
DIR="$(dirname "$0")"
source $DIR/../../utils.sh

TOOL_NAME="seclists"
SECLISTS_ARCHIVE_URL="https://github.com/danielmiessler/SecLists/archive/master.zip"
SECLISTS_ARCHIVE_TEMP_FILE="seclists.zip"
SECLISTS_FOLDER="SecLists-master"
SECLISTS_PATH="/usr/share/seclists"

preinstall_hook() {
    skip_if_folder_exists $SECLISTS_PATH
}

install_hook() {
    wget -q --show-progress $SECLISTS_ARCHIVE_URL -O /tmp/$SECLISTS_ARCHIVE_TEMP_FILE
    echo "[*] Unzipping archive"
    sudo unzip -qo /tmp/$SECLISTS_ARCHIVE_TEMP_FILE -d /tmp/
    echo "[*] Moving folder to $SECLISTS_PATH"
    sudo mv /tmp/$SECLISTS_FOLDER $SECLISTS_PATH
}

postinstall_hook() {
    rm /tmp/$SECLISTS_ARCHIVE_TEMP_FILE
}

setup_tool preinstall_hook install_hook postinstall_hook