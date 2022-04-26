#!/usr/bin/env zsh

set -e

NODE_PACKAGES=(
  http-server
  netlify-cli
  @redocly/openapi-cli
  yarn
)
for pkg in "${NODE_PACKAGES[@]}"; do printf "installing %s\n" "${pkg}" && npm install -g "${pkg}"; done
