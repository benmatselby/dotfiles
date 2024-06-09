#!/usr/bin/env zsh

set -e

# Config
ln -sf "${PWD}/mongodb/.mongoshrc.js" "${HOME}/.mongoshrc.js"
ln -sf "${PWD}/mongodb/mongosh.conf" "$(brew --prefix)/etc/mongosh.conf"
