#!/usr/bin/env bash

set -e

echo "🚀 Dev container configuration"

apt-get update

APT_PACKAGES=(
  neovim
  silversearcher-ag
  fzf
  zsh
)

for pkg in "${APT_PACKAGES[@]}"; do printf "installing %s\n" "${pkg}" && apt-get install -y "${pkg}"; done
