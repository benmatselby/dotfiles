#!/usr/bin/env sh

set -e

echo "🚀 claude configuration"

mkdir -p "${HOME}/.claude/skills"
ln -shf "${PWD}/claude/skills/git-log" "${HOME}/.claude/skills/git-log"
