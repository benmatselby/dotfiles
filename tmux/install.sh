#!/usr/bin/env zsh

set -e

printf "\n🚀 Installing tmux configuration\n"
ln -sf "${DOTFILES_LOCATION}/tmux/.tmux.conf" "${HOME}/.tmux.conf"
