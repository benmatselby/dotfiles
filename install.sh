#!/usr/bin/env bash

printf "This will ask you for your admin password\n"

# Create the /usr/local/bin folder
sudo mkdir -p /usr/local/bin

# Install oh my zsh
printf "\nInstalling oh-my-zsh\n"
if [ -d "${HOME}/.oh-my-zsh" ]; then
  printf "oh-my-zsh is already installed\n"
else
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Configure Code
printf "\nInstalling code shell command\n"
sudo ln -sf "/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code" /usr/local/bin/code
make install-vscode-ext

# Install brew to start with
# printf "\nInstalling brew\n"
#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
