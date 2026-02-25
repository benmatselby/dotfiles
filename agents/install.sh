#!/usr/bin/env sh

set -e

echo "🚀 agents configuration"

mkdir -p "${HOME}/.claude"
ln -shf "${PWD}/agents/skills" "${HOME}/.claude/skills"

mkdir -p "${HOME}/.config/opencode"
ln -shf "${PWD}/agents/skills" "${HOME}/.config/opencode/skills"
