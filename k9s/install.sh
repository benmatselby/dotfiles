#!/usr/bin/env zsh

set -e

PATH_TO_K9S="${HOME}/Library/Application Support/k9s/skins"

if [[ "$(uname -s)" == "Linux" ]]; then
  PATH_TO_K9S="${HOME}/.config/k9s/skins"
  mkdir -p "${PATH_TO_K9S}"
fi

ln -sf "${DOTFILES_LOCATION}/k9s/monokai.yaml" "${PATH_TO_K9S}/monokai.yaml"
ln -sf "${DOTFILES_LOCATION}/k9s/dracula.yaml" "${PATH_TO_K9S}/dracula.yaml"
ln -sf "${DOTFILES_LOCATION}/k9s/prod.yaml" "${PATH_TO_K9S}/prod.yaml"
ln -sf "${DOTFILES_LOCATION}/k9s/test.yaml" "${PATH_TO_K9S}/test.yaml"
