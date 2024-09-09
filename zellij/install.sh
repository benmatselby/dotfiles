#!/usr/bin/env sh

set -e

echo "🚀 zellij configuration"

mkdir -p "${HOME}/.config/zellij/themes"
ln -sf "${PWD}/zellij/config.kdl" "${HOME}/.config/zellij/config.kdl"

# Theming
ln -sf "${PWD}/themes/catppuccin/zellij.kdl" "${HOME}/.config/zellij/themes/catpuccin.kdl"
ln -sf "${PWD}/themes/nord/zellij.kdl" "${HOME}/.config/zellij/themes/nord.kdl"
ln -sf "${PWD}/themes/tokyo-night/zellij.kdl" "${HOME}/.config/zellij/themes/tokyo-night.kdl"
