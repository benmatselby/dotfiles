#!/usr/bin/env zsh

set -e

mkdir -p "${HOME}/.config/tmux/"

ln -sf "${DOTFILES_LOCATION}/tmux/.tmux.conf" "${HOME}/.tmux.conf"
ln -sf "${DOTFILES_LOCATION}/tmux/themes/" "${HOME}/.config/tmux/themes/"
