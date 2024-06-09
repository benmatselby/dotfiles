#!/usr/bin/env sh

set -e

###
# Install dependencies
###
./bin/dotfiles install omz
./bin/dotfiles install zsh
./bin/dotfiles install apt
./bin/dotfiles install brew
./bin/dotfiles install vscode
./bin/dotfiles install zed
# ./bin/dotfiles install sublime-text
./bin/dotfiles install git
./bin/dotfiles install github
./bin/dotfiles install node
./bin/dotfiles install mongodb
#./bin/dotfiles install php
./bin/dotfiles install k9s
./bin/dotfiles install starship
./bin/dotfiles install tmux
./bin/dotfiles install vim
./bin/dotfiles install neovim

echo "🚀 Manual installation/updates"
echo "Omz      omz update"
echo ""

echo "🚀 Suggestions to tidy"
echo "- Old node versions: nvm list"
echo "- ~/Library/Appliation Support"
