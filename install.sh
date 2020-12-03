#!/usr/bin/env bash

set -e
set -f

printf "This will ask you for your admin password\n"


###
# Install oh my zsh
###
printf "\n🚀 Installing oh-my-zsh\n"
if [ -d "${HOME}/.oh-my-zsh" ]; then
  printf "oh-my-zsh is already installed\n"
else
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi


###
# Install brew to start with
###
printf "\n🚀 Installing brew\n"
ABREW="/opt/homebrew/bin/brew"
IBREW="arch -x86_64 /usr/local/Homebrew/bin/brew"
if [ "$(arch)" = "arm64" ]; then
  printf "\nChecking the arm64 installation\n"
  if [ -d "/opt/homebrew" ] ; then
    ${ABREW} update
    ${ABREW} upgrade
  else
    sudo mkdir -p /opt/homebrew
    sudo chown -R "$(whoami)":wheel /opt/homebrew
    curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C /opt/homebrew
  fi

  printf "\nChecking the intel installation\n"
  if ! arch -x86_64 brew --version; then
    arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  else
    ${IBREW} update
    ${IBREW} upgrade
  fi
else
  if ! brew --version ; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
fi


###
# Install brew packages
###
printf "\n🚀 Installing brew packages\n"
printf "See https://github.com/Homebrew/brew/issues/7857 for the apple silicon support\n"
# Arm
ABREW_PACKAGES=(
  # amazon-ecs-cli
  # awscli
  # aws/tap/copilot-cli
  # bash
  # curl
  # fzf
  git
  # go
  # htop
  # httpie
  # hugo
  jq
  # k9s
  # kind
  # kubectl
  # kubectx
  # kube-ps1
  # nmap
  node
  # reattach-to-user-namespace
  # shellcheck
  # terraform
  # terragrunt
  # tflint
  # tmux
  # tmuxinator
  # wget
)
for pkg in "${ABREW_PACKAGES[@]}"; do printf "installing %s\n" "${pkg}" && ${ABREW} install "${pkg}"; done

# Intel
IBREW_PACKAGES=(
  gh
  glow
)
for pkg in "${IBREW_PACKAGES[@]}"; do printf "installing %s\n" "${pkg}" && ${IBREW} install "${pkg}"; done

printf "\nArchitectures for the brew installed applications:\n"
ALL_PACKAGES=("${IBREW_PACKAGES[@]}" "${ABREW_PACKAGES[@]}")
for pkg in "${ALL_PACKAGES[@]}"; do printf "%s - " "${pkg}" && lipo -archs "$(which "${pkg}")"; done

# Some tidying up
# ${ABREW} autoremove
# ${IBREW} autoremove
# ${ABREW} cleanup
# ${IBREW} cleanup


###
# Configure Code
###
printf "\n🚀 Installing code shell command\n"
ln -sf "/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code" /usr/local/bin/code
make install-vscode-ext
