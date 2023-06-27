#!/bin/bash

# Install pandora-chatgpt package
pip install pandora-chatgpt

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
DEST_BIN_DIR="/usr/local/bin"
DEST_PKG_DIR=""

# Check Python versions and set the destination package directory accordingly
if command -v python3.11 &> /dev/null; then
    DEST_PKG_DIR="/usr/local/lib/python3.11/dist-packages"
elif command -v python3.10 &> /dev/null; then
    DEST_PKG_DIR="/usr/local/lib/python3.10/dist-packages"
elif command -v python3.9 &> /dev/null; then
    DEST_PKG_DIR="/usr/local/lib/python3.9/dist-packages"
elif command -v python2.7 &> /dev/null; then
    DEST_PKG_DIR="/usr/local/lib/python2.7/dist-packages"
else
    echo "Error: Python 3.11, 3.10, 3.9, or Python 2.7 is required."
    exit 1
fi

mkdir -p "$DEST_BIN_DIR"  # Create the destination bin directory if it doesn't exist
mkdir -p "$DEST_PKG_DIR"  # Create the destination package directory if it doesn't exist

# Remove existing launcher.py file
rm -rf "$DEST_PKG_DIR/pandora/launcher.py"

# Clone KhafagyModeGpt repository
git clone https://github.com/5afagy/KhafagyModeGpt.git

# Move KhafagyMode script to the bin directory
chmod +x "$SCRIPT_DIR/KhafagyModeGpt/KhafagyMode"
mv "$SCRIPT_DIR/KhafagyModeGpt/KhafagyMode" "$DEST_BIN_DIR/"

# Remove existing pandora directory
rm -rf "$DEST_BIN_DIR/pandora"

# Move launcher.py to the pandora package directory
mv "$SCRIPT_DIR/KhafagyModeGpt/launcher.py" "$DEST_PKG_DIR/pandora/"
