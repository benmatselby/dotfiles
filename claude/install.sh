#!/usr/bin/env sh

set -e

echo "🚀 claude configuration"

mkdir -p "${HOME}/.claude"
ln -shf "${PWD}/claude/settings.json" "${HOME}/.claude/settings.json"
