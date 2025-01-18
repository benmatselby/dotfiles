#!/usr/bin/env sh

set -e

#if [ ! -d "$HOME/.config/nvim" ]; then
#	git clone https://github.com/LazyVim/starter ~/.config/nvim
#fi

rm "${HOME}/.config/nvim"
rm "${HOME}/.local/share/nvim"
rm "${HOME}/.local/state/nvim"
