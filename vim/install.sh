#!/usr/bin/env zsh

set -e

ln -sf "${DOTFILES_LOCATION}/vim/.vimrc" "${HOME}/.vimrc"

vim +PlugInstall +qall
vim +PlugUpgrade +qall
vim +PlugUpdate +qall
