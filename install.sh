#!/usr/bin/env sh

set -e

###
# Installation
###
./shell/install.sh
./zsh/install.sh
./git/install.sh
./brew/install.sh
./github/install.sh
./node/install.sh
./mongodb/install.sh
./k9s/install.sh
./starship/install.sh
./tmux/install.sh
./ghostty/install.sh
./sqlite/install.sh
./crush/install.sh

###
# Deprecated
###
# ./zed/install.sh
# ./neovim/install.sh
# ./sublime-text/install.sh
# ./php/install.sh
# ./vim/install.sh
# ./vscode/install.sh

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
