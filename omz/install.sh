#!/usr/bin/env zsh

set -e

if [ -d "${HOME}/.oh-my-zsh" ]; then
  printf "oh-my-zsh is already installed\n"
else
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

ln -sf "${PWD}/omz/aliases.zsh" "${HOME}/.oh-my-zsh/custom/aliases.zsh"
ln -sf "${PWD}/omz/exports.zsh" "${HOME}/.oh-my-zsh/custom/exports.zsh"
ln -sf "${PWD}/omz/functions.zsh" "${HOME}/.oh-my-zsh/custom/functions.zsh"
ln -sf "${PWD}/omz/bind.zsh" "${HOME}/.oh-my-zsh/custom/bind.zsh"
