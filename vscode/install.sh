#!/usr/bin/env zsh

set -e

if [[ "$(uname -s)" == "Linux" ]]; then
  ln -sf "${DOTFILES_LOCATION}/vscode/settings.json" "${HOME}/.config/Code/User/settings.json"
  ln -sf "${DOTFILES_LOCATION}/vscode/keybindings.json" "${HOME}/.config/Code/User/keybindings.json"
else
  ln -sf "${DOTFILES_LOCATION}/vscode/settings.json" "${HOME}/Library/Application Support/Code/User/settings.json"
  ln -sf "${DOTFILES_LOCATION}/vscode/keybindings.json" "${HOME}/Library/Application Support/Code/User/keybindings.json"
fi

CODE_EXTENSIONS=(
  42crunch.vscode-openapi
  # bmewburn.vscode-intelephense-client
  CircleCI.circleci
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
