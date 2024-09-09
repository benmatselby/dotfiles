#!/usr/bin/env sh

set -e

echo "🚀 alacritty configuration"

# Link all the themes
mkdir -p "${HOME}/.config/alacritty"
ln -sf "${PWD}/alacritty/alacritty.toml" "${HOME}/.config/alacritty/alacritty.toml"
ln -sf "${PWD}/alacritty/defaults.toml" "${HOME}/.config/alacritty/defaults.toml"
ln -sf "${PWD}/themes/nord/alacritty.toml" "${HOME}/.config/alacritty/theme.toml"
