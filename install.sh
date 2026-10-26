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

# Mac
if [[ "$OS" == "Darwin" ]]; then
  mas install 441258766 # Magnet
  mas install 497799835 # Xcode
  sudo xcode-select -s /Applications/Xcode.app/Contents/Developer
  sudo xcodebuild -license accept
  sudo xcodebuild -runFirstLaunch
  sudo xcodebuild -downloadPlatform iOS
fi

# Rust
rustup default stable
rustup component add rustfmt

# File symlinks
mkdir -p "$HOME/.config"
ln -sf "$HOME/dotfiles/shell/.zshrc" "$HOME/.zshrc"
ln -sf "$HOME/dotfiles/git/.gitconfig" "$HOME/.gitconfig"

# Directory symlinks
ln -sfn "$HOME/dotfiles/ghostty" "$HOME/.config/ghostty"
ln -sfn "$HOME/dotfiles/oh-my-posh" "$HOME/.config/oh-my-posh"

# zsh
if [[ "$SHELL" != */zsh ]]; then
  which zsh | sudo tee -a /etc/shells
  chsh -s $(which zsh)
fi

echo "Done!"
