#!/usr/bin/env zsh

set -e

ln -sf "${DOTFILES_LOCATION}/k9s/monokai.yml" "${HOME}/Library/Application Support/k9s/skin.yml"
ln -sf "${DOTFILES_LOCATION}/k9s/prod_skin.yml" "${HOME}/Library/Application Support/k9s/prod_skin.yml"
ln -sf "${DOTFILES_LOCATION}/k9s/testing_skin.yml" "${HOME}/Library/Application Support/k9s/inc_skin.yml"
ln -sf "${DOTFILES_LOCATION}/k9s/testing_skin.yml" "${HOME}/Library/Application Support/k9s/test_skin.yml"
ln -sf "${DOTFILES_LOCATION}/k9s/testing_skin.yml" "${HOME}/Library/Application Support/k9s/staging_skin.yml"
