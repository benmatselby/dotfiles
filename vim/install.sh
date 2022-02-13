#!/usr/bin/env zsh

set -e

printf "\n🚀 Installing vim configuration\n"
ln -sf "${DOTFILES_LOCATION}/vim/.vimrc" "${HOME}/.vimrc"
