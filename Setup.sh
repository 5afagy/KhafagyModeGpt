#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
DEST_BIN_DIR="$HOME/.local/bin"
DEST_PKG_DIR="$HOME/.local/lib/python3.11/site-packages"

if [ "$EUID" -eq 0 ]; then
    USER_HOME=$(eval echo ~$SUDO_USER)
    DEST_BIN_DIR="$USER_HOME/.local/bin"
    DEST_PKG_DIR="$USER_HOME/.local/lib/python3.11/site-packages"
fi

mkdir -p "$DEST_BIN_DIR"  # Create the destination bin directory if it doesn't exist
mkdir -p "$DEST_PKG_DIR"  # Create the destination package directory if it doesn't exist

mv "$SCRIPT_DIR/KhafagyMode" "$DEST_BIN_DIR/"
chmod +x "$DEST_BIN_DIR/KhafagyMode"
mv "$SCRIPT_DIR/../KhafagyModeGpt" "$DEST_PKG_DIR/"
