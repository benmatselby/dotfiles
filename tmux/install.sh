#!/usr/bin/env sh

set -e

echo "🚀 tmux configuration"

mkdir -p "${HOME}/.config/tmux"

# Symlink the one we prefer
ln -sf "${PWD}/tmux/.tmux.conf" "${HOME}/.tmux.conf"
ln -sf "${PWD}/tmux/catppuccin.conf" "${HOME}/.config/tmux/theme.conf"
