#!/usr/bin/env sh

echo "🚀 PHP configuration"

if [ "$(arch)" = "arm64" ]; then
  arch -arm64 sudo pecl install xdebug || true
else
  pecl install xdebug || true
fi
