#!/usr/bin/env zsh

set -e

mkdir -p "${HOME}/.config/tmux/"

ln -sf "${PWD}/tmux/.tmux.conf" "${HOME}/.tmux.conf"
ln -sf "${PWD}/tmux/themes" "${HOME}/.config/tmux/themes"
