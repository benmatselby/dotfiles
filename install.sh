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
./mongodb/install.sh
./k9s/install.sh
./tmux/install.sh
./ghostty/install.sh
./sqlite/install.sh
./agents/install.sh
./neovim/install.sh
./sublime-text/install.sh

###
# Deprecated
###
# Moved to neovim
# ./zed/install.sh
# ./vim/install.sh
# ./vscode/install.sh
# Moved to mise
# ./node/install.sh
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
echo "npm:    npm cache clean --force"
echo "go:     go clean -cache"
echo "go:     go clean -modcache"
echo "uv:     uv cache clean"
