#!/usr/bin/env sh

set -e

#if [ ! -d "$HOME/.config/nvim" ]; then
#	git clone https://github.com/LazyVim/starter ~/.config/nvim
#fi

rm -fr "${HOME}/.config/nvim"
rm -fr "${HOME}/.local/share/nvim"
rm -fr "${HOME}/.local/state/nvim"
