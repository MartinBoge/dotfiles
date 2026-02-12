#!/bin/bash
set -e

# Linux
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  sudo apt update && sudo apt upgrade -y
  sudo apt install -y build-essential
fi

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle

# Global NPM packages
npm install -g \
  svelte-language-server

# Rust
if ! command -v rustup &> /dev/null; then
  rustup-init -y
fi
source "$HOME/.cargo/env"
rustup component add rustfmt rust-analyzer

# Stow
stow shell git tmux oh-my-posh neovim

# zsh
if [[ "$SHELL" != */zsh ]]; then
  chsh -s $(which zsh)
fi

echo "Done!"
