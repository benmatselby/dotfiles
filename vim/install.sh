#!/usr/bin/env zsh

set -e

ln -sf "${PWD}/vim/.vimrc" "${HOME}/.vimrc"

vim +PlugInstall +qall
vim +PlugUpgrade +qall
vim +PlugUpdate +qall
