#!/usr/bin/env zsh

set -e

mkdir -p "${HOME}/.config/tmux/"

ln -shf "${PWD}/tmux/.tmux.conf" "${HOME}/.tmux.conf"
ln -shf "${PWD}/tmux/themes" "${HOME}/.config/tmux/themes"
