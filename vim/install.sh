#!/usr/bin/env sh

set -e

echo "🚀 vim configuration"

ln -sf "${PWD}/vim/.vimrc" "${HOME}/.vimrc"

vim +PlugInstall +qall
vim +PlugUpgrade +qall
vim +PlugUpdate +qall
