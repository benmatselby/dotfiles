#!/usr/bin/env bash

set -e

if test ! "$(which brew)"; then
  echo "🚀 Installing the brew package manager"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

###
# Install brew packages
###
echo "🚀 Installing brew packages"

# Taps
brew tap hashicorp/tap

BASE_PACKAGES=(
  ag
  awscli
  bash
  composer
  cowsay
  fzf
  gh
  git
  glow
  gnupg
  go
  golangci-lint
  gron
  hashicorp/tap/terraform
  htop
  hugo
  jq
  k6
  k9s
  kube-ps1
  kubectl
  kubectx
  lazydocker
  mongosh
  mysql-client
  neovim
  nvm
  php
  pyenv
  reattach-to-user-namespace
  shellcheck
  starship
  terragrunt
  tflint
  tldr
  tmux
  tmuxinator
  vim
)

for pkg in "${BASE_PACKAGES[@]}"; do printf "installing %s\n" "${pkg}" && brew install "${pkg}"; done

# Casks
brew install --cask font-fira-code
brew install --cask font-hack-nerd-font
# brew install --cask session-manager-plugin

# Some tidying up
brew autoremove -v
brew cleanup --prune=all
