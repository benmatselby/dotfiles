#!/usr/bin/env zsh

set -e

# Installation
gh extension install dlvhdr/gh-dash || true

# Upgrades
gh extension upgrade --all

# Config
ln -sf "${DOTFILES_LOCATION}/github/gh-dash.yml" "${HOME}/.config/gh-dash/config.yml"
mkdir -p "${HOME}/.config/gh/"
ln -sf "${DOTFILES_LOCATION}/github/gh-config.yml" "${HOME}/.config/gh/config.yml"
