#!/usr/bin/env sh

set -e

echo "🚀 crush configuration"

mkdir -p "${HOME}/.config/crush"

ln -sf "${PWD}/crush/crush.json" "${HOME}/.config/crush/crush.json"
