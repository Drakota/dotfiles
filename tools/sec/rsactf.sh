#!/bin/sh
DIR="$(dirname "$0")"
source $DIR/../../utils.sh

TOOL_NAME="rsactf"
RSACTF_GIT_URL="https://github.com/Ganapati/RsaCtfTool.git"
RSACTF_MAIN_FILE="RsaCtfTool.py"

preinstall_hook() { 
    check_python_install
    check_debian_based
}

install_hook() {
    sudo git clone $RSACTF_GIT_URL /usr/share/$TOOL_NAME
    echo "[*] Installing dependencies"
    sudo apt-get install libgmp3-dev libmpc-dev 
    python3 -m pip install -r /usr/share/$TOOL_NAME/requirements.txt
    ln -sf /usr/share/$TOOL_NAME/$RSACTF_MAIN_FILE $HOME/.local/bin/$TOOL_NAME
}

postinstall_hook() { :; }

setup_tool preinstall_hook install_hook postinstall_hook