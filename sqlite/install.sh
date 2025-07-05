#!/usr/bin/env sh

set -e

echo "🚀 SQLite configuration"

# Symlink the one we prefer
ln -sf "${PWD}/sqlite/sqliterc" "${HOME}/.sqliterc"
