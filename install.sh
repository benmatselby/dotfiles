#!/usr/bin/env sh

set -e

###
# Installation
###
./omz/install.sh
./zsh/install.sh
./git/install.sh
./vim/install.sh
./brew/install.sh
./vscode/install.sh
./github/install.sh
./node/install.sh
./mongodb/install.sh
./k9s/install.sh
./starship/install.sh
./tmux/install.sh

###
# Deprecated
###
# ./zed/install.sh
# ./neovim/install.sh
# ./sublime-text/install.sh
# ./php/install.sh

###
# Manual notifications
###
echo "🚀 Manual installation/updates"
echo "Omz:     omz update"
echo "Gcloud:  gcloud components update"
echo ""

echo "🚀 Suggestions to tidy"
echo "- Old node versions: nvm list"
echo "- ~/Library/Appliation Support"
