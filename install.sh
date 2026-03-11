#!/usr/bin/env bash
set -e

OS=$(uname -s)

# Linux
if [[ "$OS" == "Linux" ]]; then
  sudo apt update && sudo apt upgrade -y
  sudo apt install -y build-essential
fi

# Homebrew
if [[ "$OS" == "Linux" ]]; then
  BREW_PATH="/home/linuxbrew/.linuxbrew/bin/brew"
elif [[ "$OS" == "Darwin" ]]; then
  BREW_PATH="/opt/homebrew/bin/brew"
fi
if [[ ! -f "$BREW_PATH" ]]; then
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
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

# File symlinks
ln -sf "$HOME/dotfiles/shell/.zshrc" "$HOME/.zshrc"
ln -sf "$HOME/dotfiles/git/.gitconfig" "$HOME/.gitconfig"
ln -sf "$HOME/dotfiles/tmux/.tmux.conf" "$HOME/.tmux.conf"

# Directory symlinks
ln -sfn "$HOME/dotfiles/neovim" "$HOME/.config/nvim"
ln -sfn "$HOME/dotfiles/ghostty" "$HOME/.config/ghostty"
ln -sfn "$HOME/dotfiles/oh-my-posh" "$HOME/.config/oh-my-posh"

# zsh
if [[ "$SHELL" != */zsh ]]; then
  which zsh | sudo tee -a /etc/shells
  chsh -s $(which zsh)
fi

echo "Done!"
