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
