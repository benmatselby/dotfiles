#!/usr/bin/env zsh

set -e

ln -sf "${DOTFILES_LOCATION}/zed/settings.json" "${HOME}/.config/zed/settings.json"
ln -sf "${DOTFILES_LOCATION}/zed/keybindings.json" "${HOME}/.config/zed/keymap.json"

echo $?
