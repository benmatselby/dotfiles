#!/usr/bin/env zsh

set -e

ln -sf "${DOTFILES_LOCATION}/vscode/settings.json" "${HOME}/Library/Application Support/Code/User/settings.json"
ln -sf "${DOTFILES_LOCATION}/vscode/keybindings.json" "${HOME}/Library/Application Support/Code/User/keybindings.json"

CODE_EXTENSIONS=(
  bmewburn.vscode-intelephense-client
  DavidAnson.vscode-markdownlint
  dbaeumer.vscode-eslint
  esbenp.prettier-vscode
  firsttris.vscode-jest-runner
  # felixfbecker.php-intellisense
  github.remotehub
  github.vscode-pull-request-github
  golang.go
  hashicorp.terraform
  ms-azuretools.vscode-docker
  ms-python.isort
  ms-python.python
  ms-python.vscode-pylance
  ms-vscode-remote.remote-containers
  ms-vscode.remote-repositories
  rangav.vscode-thunder-client
  sdras.night-owl
  streetsidesoftware.code-spell-checker
  # timonwong.shellcheck
  Tyriar.sort-lines
  xdebug.php-debug
)
for ext in "${CODE_EXTENSIONS[@]}"; do printf "installing %s\n" "${ext}" && code --install-extension "${ext}" --force; done
