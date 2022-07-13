#!/usr/bin/env zsh

set -e

# Config
ln -sf "${DOTFILES_LOCATION}/mongodb/.mongoshrc.js" "${HOME}/.mongoshrc.js"
ln -sf "${DOTFILES_LOCATION}/mongodb/mongosh.conf" "/opt/homebrew/etc/mongosh.conf"
