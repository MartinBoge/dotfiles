#!/bin/bash
set -e

sudo -v

# Linux
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  sudo apt update && sudo apt upgrade -y
  sudo apt install -y build-essential
fi

# Homebrew
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  BREW_PATH="/home/linuxbrew/.linuxbrew/bin/brew"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  BREW_PATH="/opt/homebrew/bin/brew"
fi
if [[ ! -f "$BREW_PATH" ]]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$($BREW_PATH shellenv)"
brew bundle

# Global NPM packages
npm install -g \
  svelte-language-server

# Rust
if [[ ! -f "$HOME/.cargo/env" ]]; then
  rustup-init -y
fi
. "$HOME/.cargo/env"
rustup component add rustfmt rust-analyzer

# Stow
stow shell git tmux oh-my-posh neovim

# zsh
if [[ "$SHELL" != */zsh ]]; then
  which zsh | sudo tee -a /etc/shells
  chsh -s $(which zsh)
fi

echo "Done!"
