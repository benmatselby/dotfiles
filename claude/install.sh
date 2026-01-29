#!/usr/bin/env sh

set -e

echo "🚀 claude configuration"

mkdir -p "${HOME}/.claude"
ln -shf "${PWD}/claude/skills" "${HOME}/.claude/skills"
