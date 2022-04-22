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
# Arm
ABREW_PACKAGES=(
  # awscli
  bash
  fzf
  gh
  git
  go
  glow
  htop
  hugo
  jq
  # k9s
  # kind
  # kubectl
  # kubectx
  # kube-ps1
  # multipass
  # nmap
  nvm
  openssl # Pyenv build dep
  pyenv
  reattach-to-user-namespace
  readline # Pyenv build dep
  # shellcheck
  sqlite3 # Pyenv build dep
  starship
  terraform
  # terragrunt
  # tflint
  tmux
  tmuxinator
  # wget
  xz # Pyenv build dep
  zlib # Pyenv build dep
)
for pkg in "${ABREW_PACKAGES[@]}"; do printf "installing %s\n" "${pkg}" && brew install "${pkg}"; done

printf "\nArchitectures for the brew installed applications:\n"
ALL_PACKAGES=("${IBREW_PACKAGES[@]}" "${ABREW_PACKAGES[@]}")
for pkg in "${ALL_PACKAGES[@]}"; do printf "%s - " "${pkg}" && (lipo -archs "$(command -v "${pkg}")" || true); done

# Some tidying up
brew autoremove -v
brew cleanup --prune=all
