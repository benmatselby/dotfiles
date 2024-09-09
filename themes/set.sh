#!/usr/bin/env sh

# Get first argument
if [ -z "$1" ]; then
  echo "Usage: $0 <theme>"
  exit 1
fi

# Set theme
THEME=$1

# Backgrounds
echo "Setting background to ${THEME}"
echo "${PWD}/themes/${THEME}/background.png"
osascript -e "tell application \"System Events\" to set picture of every desktop to \"${PWD}/themes/${THEME}/background.png\""

# Zellij

# Neovim

# VSCode
