#!/usr/bin/env sh

set -e

echo "🚀 MongoDB configuration"

# Config
ln -sf "${PWD}/mongodb/.mongoshrc.js" "${HOME}/.mongoshrc.js"
ln -sf "${PWD}/mongodb/mongosh.conf" "$(brew --prefix)/etc/mongosh.conf"
