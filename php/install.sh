#!/usr/bin/env sh

if [ "$(arch)" = "arm64" ]; then
  arch -arm64 sudo pecl install xdebug || true
else
  pecl install xdebug || true
fi
