#!/usr/bin/env zsh

set -e

if test ! $(which brew); then
  printf "\n🚀 Installing the brew package manager\n"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

###
# Install brew packages
###
printf "\n🚀 Installing brew packages\n"

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
  htop
  hugo
  jq
  k6
  k9s
  kubectl
  kubectx
  kube-ps1
  lazydocker
  mongosh
  mysql-client
  neovim
  nvm
  php
  shellcheck
  starship
  tldr
  tmux
  tmuxinator
  vim
)

if [ $(arch) = "arm64" ]; then
  BASE_PACKAGES+=(
    pyenv
    reattach-to-user-namespace
    hashicorp/tap/terraform
    terragrunt
    tflint
  )
fi

for pkg in "${BASE_PACKAGES[@]}"; do printf "installing %s\n" "${pkg}" && brew install "${pkg}"; done

# Casks (only on Mac)
if [ $(arch) = "arm64" ]; then
  brew install --cask font-fira-code
  brew install --cask font-hack-nerd-font
  # brew install --cask session-manager-plugin
fi

# Some tidying up
brew autoremove -v
brew cleanup --prune=all
