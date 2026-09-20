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
brew install tuicr
brew install opencode

###
# Installation
###
./neovim/install.sh
./github/install.sh
./bash/install.sh
./tmux/install.sh
./tuicr/install.sh
./ghostty/install.sh
./agents/install.sh
