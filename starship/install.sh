#!/usr/bin/env sh

set -e

echo "🚀 Starship configuration"

ln -sf "${PWD}/starship/starship.toml" "${HOME}/.config/starship.toml"
ln -sf "${PWD}/starship/starship-pastel.toml" "${HOME}/.config/starship-pastel.toml"
