#!/bin/bash

echo "Installing dependencies via APT..."
sudo apt update
sudo apt upgrade -y
sudo apt install -y \
    unzip

echo "Installing dependencies manually..."

# Oh My Posh
curl -s https://ohmyposh.dev/install.sh | bash -s

# Lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/
rm lazygit lazygit.tar.gz

echo "Sourcing utils..."
source utils.sh

echo "Setting up symlinks..."
create_symlink bash/.bashrc ~/.bashrc
create_symlink oh-my-posh/config.json ~/.config/oh-my-posh/config.json

echo "Done! Restarting shell..."
exec "$SHELL"
