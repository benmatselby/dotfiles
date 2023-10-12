#!/usr/bin/env zsh

set -e

ln -sf "${DOTFILES_LOCATION}/starship/starship.toml" "${HOME}/.config/starship.toml"
ln -sf "${DOTFILES_LOCATION}/starship/starship-pastel.toml" "${HOME}/.config/starship-pastel.toml"
