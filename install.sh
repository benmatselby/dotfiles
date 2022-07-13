#!/usr/bin/env zsh

set -e

###
# Installation of packages, configurations, and dotfiles.
###
DOTFILES_LOCATION=$(pwd)
export DOTFILES_LOCATION;

###
# Install dependencies
###
./bin/dotfiles install omz
./bin/dotfiles install zsh
./bin/dotfiles install brew
./bin/dotfiles install vscode
./bin/dotfiles install git
./bin/dotfiles install github
./bin/dotfiles install node
./bin/dotfiles install mongodb
./bin/dotfiles install starship
./bin/dotfiles install tmux
./bin/dotfiles install vim
