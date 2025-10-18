#!/bin/sh
set -e

# Install dependencies
apk add --no-cache \
  curl \
  git \
  wget \
  xclip \
  wl-clipboard \
  ripgrep \
  build-base \
  gzip \
  unzip \
  tar \
  neovim \
  lazygit
