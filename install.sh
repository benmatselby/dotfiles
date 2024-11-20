#!/usr/bin/env sh

set -e

# Some checks to see if we are running in dev containers
if [ -n "${CODESPACES}" ]; then
  export RUNNING_IN_DEV_CONTAINER=1
fi

if [ -n "${RUNNING_IN_DEV_CONTAINER}" ]; then
  echo "🏃 Running in dev container"
fi

###
# Installation
###
./omz/install.sh
./zsh/install.sh
./git/install.sh

###
# Applications (Only when not in a dev container)
###
if [ -z "${RUNNING_IN_DEV_CONTAINER}" ]; then
  ./brew/install.sh
  ./vscode/install.sh
  ./zed/install.sh
fi

###
# Application configurations (Only when not in a dev container)
###
if [ -z "${RUNNING_IN_DEV_CONTAINER}" ]; then
  ./github/install.sh
  ./node/install.sh
  ./mongodb/install.sh
  ./k9s/install.sh
  ./starship/install.sh
  ./tmux/install.sh
  ./neovim/install.sh
fi

###
# Deprecated
###
#./sublime-text/install.sh
#./php/install.sh
#./vim/install.sh

###
# Manual notifications
###
echo "🚀 Manual installation/updates"
echo "Omz:     omz update"
echo "Gcloud:  gcloud components update
echo ""

echo "🚀 Suggestions to tidy"
echo "- Old node versions: nvm list"
echo "- ~/Library/Appliation Support"
