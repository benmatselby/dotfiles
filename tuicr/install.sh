#!/usr/bin/env sh

set -e

echo "🚀 tuicr configuration"

# Config
mkdir -p "${HOME}/.config/tuicr/"
ln -sf "${PWD}/tuicr/config.toml" "${HOME}/.config/tuicr/config.toml"
