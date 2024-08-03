#!/usr/bin/env sh

set -e

###
# Installation
###
./omz/install.sh
./zsh/install.sh
./git/install.sh

###
# Applications
###
./brew/install.sh
./vscode/install.sh
./zed/install.sh

###
# Application configurations
###
./github/install.sh
./node/install.sh
./mongodb/install.sh
./k9s/install.sh
./starship/install.sh
./tmux/install.sh
./vim/install.sh
./neovim/install.sh

###
# Deprecated
###
#./sublime-text/install.sh
#./php/install.sh

###
# Manual notifications
###
echo "🚀 Manual installation/updates"
echo "Omz: omz update"
echo ""

echo "🚀 Suggestions to tidy"
echo "- Old node versions: nvm list"
echo "- ~/Library/Appliation Support"
