#!/usr/bin/env zsh

set -e

if [ -d "${HOME}/.oh-my-zsh" ]; then
  printf "oh-my-zsh is already installed\n"
else
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

ln -sf "${DOTFILES_LOCATION}/omz/aliases.zsh" "${HOME}/.oh-my-zsh/custom/aliases.zsh"
ln -sf "${DOTFILES_LOCATION}/omz/exports.zsh" "${HOME}/.oh-my-zsh/custom/exports.zsh"
ln -sf "${DOTFILES_LOCATION}/omz/functions.zsh" "${HOME}/.oh-my-zsh/custom/functions.zsh"
