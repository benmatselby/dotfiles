#!/usr/bin/env sh

set -e

echo "🚀 tmux configuration"

mkdir -p "${HOME}/.config/tmux"

# Symlink the one we prefer
ln -sf "${PWD}/tmux/.tmux.conf" "${HOME}/.tmux.conf"
ln -snf "${PWD}/tmux/functions.zsh" "${HOME}/.oh-my-zsh/custom/tmux-functions.zsh"
ln -sf "${PWD}/tmux/agent-state.sh" "${HOME}/.config/tmux/agent-state.sh"
