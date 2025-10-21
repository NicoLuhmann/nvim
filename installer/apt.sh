#!/bin/bash
set -e

# Detect if running as root
if [[ $EUID -eq 0 ]]; then
  SUDO=""
else
  SUDO="sudo"
fi

# Install dependencies
$SUDO apt-get update
$SUDO apt-get install -y \
  curl \
  git \
  wget \
  xclip \
  wl-clipboard \
  ripgrep \
  build-essential \
  gzip \
  unzip \
  tar

# Install Neovim
NVIM_VERSION="0.11.4"
arch=$(uname -m)

declare -A nvim_archives=(
  ["x86_64"]="nvim-linux-x86_64"
  ["aarch64"]="nvim-linux-arm64"
)

declare -A lazygit_archives=(
  ["x86_64"]="Linux_x86_64"
  ["aarch64"]="Linux_arm64"
)

if [[ -n "${nvim_archives[$arch]}" && -n "${lazygit_archives[$arch]}" ]]; then
  # Install latest lazygit
  LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": *"v\K[^"]*')
  LAZYGIT_ARCHIVE="${lazygit_archives[$arch]}"
  curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_${LAZYGIT_ARCHIVE}.tar.gz"
  tar xf lazygit.tar.gz lazygit
  $SUDO install lazygit -D -t /usr/local/bin/
  rm lazygit.tar.gz lazygit
  echo "Lazygit installed successfully."
  
  # Install neovim
  NVIM_ARCHIVE="${nvim_archives[$arch]}"
  curl -LO "https://github.com/neovim/neovim/releases/download/v${NVIM_VERSION}/${NVIM_ARCHIVE}.tar.gz"
  $SUDO rm -rf "/opt/${NVIM_ARCHIVE}"
  $SUDO tar -C /opt -xzf "${NVIM_ARCHIVE}.tar.gz"
  $SUDO ln -sf "/opt/${NVIM_ARCHIVE}/bin/nvim" /usr/local/bin/nvim
  rm "${NVIM_ARCHIVE}.tar.gz"
else
  echo "Unsupported architecture: $arch"
  if [[ -z "${lazygit_archives[$arch]}" ]]; then
    echo "No lazygit archive available for $arch"
  fi
  if [[ -z "${nvim_archives[$arch]}" ]]; then
    echo "No Neovim archive available for $arch"
  fi
  exit 1
fi

echo ""
echo "--------------------------------------------------------"
echo "Installing nvm and Node.js..."
echo "--------------------------------------------------------"

export NVM_DIR="$HOME/.nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

nvm install 25
nvm use 25

echo "Node.js $(node --version) installed successfully."
echo "npm $(npm --version) installed successfully."

echo ""
echo "--------------------------------------------------------"
echo "Neovim setup complete!"
echo "--------------------------------------------------------"

if [[ -t 0 ]]; then
  read -p "Do you want to install OpenCode? (y/n): " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Installing OpenCode..."
    curl -fsSL https://opencode.ai/install | bash
    echo "OpenCode installed successfully."
  else
    echo "Skipping OpenCode installation."
  fi
else
  echo "Non-interactive terminal detected. Skipping OpenCode installation."
fi
