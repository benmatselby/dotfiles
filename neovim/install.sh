#!/usr/bin/env zsh

set -e

#if [ ! -d "$HOME/.config/nvim" ]; then
#	git clone https://github.com/LazyVim/starter ~/.config/nvim
#fi

ln -sf "${PWD}/neovim/lazy-vim" "${HOME}/.config/nvim"
