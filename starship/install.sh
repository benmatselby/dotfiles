#!/usr/bin/env zsh

set -e

printf "\n🚀 Installing starship\n"
ln -sf "${DOTFILES_LOCATION}/starship/starship.toml" "${HOME}/.config/starship.toml"
