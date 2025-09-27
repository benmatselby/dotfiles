#!/usr/bin/env sh

set -e

###
# Install some basics
###
snap install ghostty --classic
brew install nvim luajit
brew install fzf
brew install git
brew install tmux tmuxinator
brew install ripgrep
brew install fd
brew install lazygit
brew install nvm
brew install tree-sitter tree-sitter-cli
brew install go

###
# Installation
###
./neovim/install.sh
./bash/install.sh
./tmux/install.sh
