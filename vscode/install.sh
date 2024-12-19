#!/usr/bin/env bash

set -e

echo "🚀 VSCode configuration"

PATH_TO_VSCODE_SETTINGS="${HOME}/Library/Application Support/Code/User"

if [[ "$(uname -s)" == "Linux" ]]; then
  PATH_TO_VSCODE_SETTINGS="${HOME}/.config/Code/User"
  mkdir -p "${PATH_TO_VSCODE_SETTINGS}"
fi

ln -sf "${PWD}/vscode/settings.json" "${PATH_TO_VSCODE_SETTINGS}/settings.json"
ln -sf "${PWD}/vscode/keybindings.json" "${PATH_TO_VSCODE_SETTINGS}/keybindings.json"

CODE_EXTENSIONS=(
  42crunch.vscode-openapi
  # bmewburn.vscode-intelephense-client
  DavidAnson.vscode-markdownlint
  dbaeumer.vscode-eslint
  esbenp.prettier-vscode
  firsttris.vscode-jest-runner
  github.copilot
  github.copilot-chat
  github.vscode-github-actions
  github.vscode-pull-request-github
  golang.go
  # hashicorp.terraform
  ms-azuretools.vscode-docker
  ms-vscode-remote.remote-containers
  ms-vscode.remote-repositories
  streetsidesoftware.code-spell-checker
  # timonwong.shellcheck
  Tyriar.sort-lines
  # xdebug.php-debug
)
for ext in "${CODE_EXTENSIONS[@]}"; do printf "installing %s\n" "${ext}" && code --install-extension "${ext}" --force; done
