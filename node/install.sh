#!/usr/bin/env zsh

set -e

# Load nvm
export NVM_DIR="$HOME/.nvm"
if [ "$(arch)" = "arm64" ]; then
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
fi

if [[ "$(uname -s)" == "Linux" ]]; then
  [ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && . "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
fi

# The version of node mainly used
ACTIVE_NODE_VERSION=20

echo "Installing ${ACTIVE_NODE_VERSION} version of node"
nvm install ${ACTIVE_NODE_VERSION}

echo "Activating ${ACTIVE_NODE_VERSION} version of node"
nvm alias default ${ACTIVE_NODE_VERSION}

echo "Installing node packages"
NODE_PACKAGES=(
  http-server
  # netlify-cli
  @redocly/openapi-cli
  ttab
  yarn
)
for pkg in "${NODE_PACKAGES[@]}"; do printf "installing %s\n" "${pkg}" && npm install -g "${pkg}"; done
