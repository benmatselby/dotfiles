#!/usr/bin/env sh

set -e

echo "🚀 git configuration"

# Check if the file exists
if [ ! -f "${HOME}/.gitconfig.local" ]; then
  cp "${PWD}/git/.gitconfig.local" "${HOME}/.gitconfig.local"
  @echo "ℹ️ git configuration: created ${HOME}/.gitconfig.local - Please update it!!"
fi

ln -sf "${PWD}/git/.gitconfig" "${HOME}/.gitconfig"
ln -sf "${PWD}/git/.gitignore" "${HOME}/.gitignore"
ln -sf "${PWD}/git/git_functions.zsh" "${HOME}/.oh-my-zsh/custom/git_functions.zsh"
