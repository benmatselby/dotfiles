#!/usr/bin/env zsh

set -e

ln -sf "${PWD}/zsh/.zshrc" "${HOME}/.zshrc"
ln -sf "${PWD}/zsh/benmatselby.zsh-theme" "${HOME}/.oh-my-zsh/custom/themes/"
