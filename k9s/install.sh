#!/usr/bin/env zsh

set -e

if [[ "$(uname -s)" == "Linux" ]]; then
  PATH_TO_K9S="${HOME}/.config/k9s/skins"
  mkdir -p "${PATH_TO_K9S}"
else
  PATH_TO_K9S="${HOME}/Library/Application Support/k9s"
fi

ln -sf "${DOTFILES_LOCATION}/k9s/monokai.yml" "${PATH_TO_K9S}/skin.yml"
ln -sf "${DOTFILES_LOCATION}/k9s/prod_skin.yml" "${PATH_TO_K9S}/prod_skin.yml"
ln -sf "${DOTFILES_LOCATION}/k9s/testing_skin.yml" "${PATH_TO_K9S}/inc_skin.yml"
ln -sf "${DOTFILES_LOCATION}/k9s/testing_skin.yml" "${PATH_TO_K9S}/rp_skin.yml"
ln -sf "${DOTFILES_LOCATION}/k9s/testing_skin.yml" "${PATH_TO_K9S}/test_skin.yml"
ln -sf "${DOTFILES_LOCATION}/k9s/testing_skin.yml" "${PATH_TO_K9S}/staging_skin.yml"
