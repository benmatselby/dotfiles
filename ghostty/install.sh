#!/usr/bin/env bash

set -e

echo "🚀 Ghostty configuration"

PATH_TO_GHOSTTY="${HOME}/Library/Application Support/com.mitchellh.ghostty/"

mkdir -p "${PATH_TO_GHOSTTY}"

ln -sf "${PWD}/ghostty/config" "${PATH_TO_GHOSTTY}/config"
