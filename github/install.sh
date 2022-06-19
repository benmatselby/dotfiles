#!/usr/bin/env zsh

set -e

# Installation
gh extension install dlvhdr/gh-dash || true

# Upgrades
gh extension upgrade --all
