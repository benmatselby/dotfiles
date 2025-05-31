#!/usr/bin/env bash

set -e

if test ! "$(which brew)"; then
  echo "🚀 Installing the brew package manager"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

###
# Install brew packages
###
echo "🚀 Installing brew packages"
brew bundle --file="brew/Brewfile"

# Some tidying up
brew autoremove -v
brew cleanup --prune=all
