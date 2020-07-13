FROM php:7.4

RUN apt-get update && \
  apt-get install -y \
  git zip make vim

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /app

