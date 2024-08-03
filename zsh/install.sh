#!/usr/bin/env sh

set -e

echo "🚀 zsh installation"

ln -sf "${PWD}/zsh/.zshrc" "${HOME}/.zshrc"
ln -sf "${PWD}/zsh/benmatselby.zsh-theme" "${HOME}/.oh-my-zsh/custom/themes/"
