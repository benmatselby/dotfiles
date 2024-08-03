#!/usr/bin/env sh

set -e

echo "🚀 k9s configuration"

PATH_TO_K9S="${HOME}/Library/Application Support/k9s/skins"

if [[ "$(uname -s)" == "Linux" ]]; then
  PATH_TO_K9S="${HOME}/.config/k9s/skins"
fi
mkdir -p "${PATH_TO_K9S}"

ln -sf "${PWD}/k9s/monokai.yaml" "${PATH_TO_K9S}/monokai.yaml"
ln -sf "${PWD}/k9s/dracula.yaml" "${PATH_TO_K9S}/dracula.yaml"
ln -sf "${PWD}/k9s/prod.yaml" "${PATH_TO_K9S}/prod.yaml"
ln -sf "${PWD}/k9s/test.yaml" "${PATH_TO_K9S}/test.yaml"
