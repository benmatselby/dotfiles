#!/usr/bin/env sh

set -e

echo "🚀 tmux configuration"

# Link all the themes
ln -shf "${PWD}/tmux" "${HOME}/.config/tmux"

# Symlink the one we prefer
ln -shf "${HOME}/.config/tmux/themes/basic.conf" "${HOME}/.tmux.conf"
