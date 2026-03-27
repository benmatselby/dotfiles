#!/usr/bin/env sh

set -e

echo "🚀 agents configuration"

mkdir -p "${HOME}/.config/opencode"
ln -shf "${PWD}/agents/skills" "${HOME}/.config/opencode/skills"
ln -shf "${PWD}/agents/plugins" "${HOME}/.config/opencode/plugins"
ln -shf "${PWD}/agents/commands" "${HOME}/.config/opencode/commands"
