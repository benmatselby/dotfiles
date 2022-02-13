#!/usr/bin/env zsh

set -e

printf "\n🚀 Install node packages\n"
NODE_PACKAGES=(
  http-server
  netlify-cli
)
for pkg in "${NODE_PACKAGES[@]}"; do printf "installing %s\n" "${pkg}" && npm install -g "${pkg}"; done
