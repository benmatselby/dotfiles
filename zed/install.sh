#!/usr/bin/env zsh

set -e

mkdir -p ${HOME}/.config/zed/
ln -sf "${PWD}/zed/settings.json" "${HOME}/.config/zed/settings.json"
ln -sf "${PWD}/zed/keybindings.json" "${HOME}/.config/zed/keymap.json"
