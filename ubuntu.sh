#!/bin/bash

echo "Installing dependencies via APT..."
sudo apt update
sudo apt upgrade -y
sudo apt install -y \
    unzip

echo "Installing dependencies manually..."
curl -s https://ohmyposh.dev/install.sh | bash -s

echo "Sourcing utils..."
source utils.sh

echo "Setting up symlinks..."
create_symlink bash/.bashrc ~/.bashrc
create_symlink oh-my-posh/config.json ~/.config/oh-my-posh/config.json

echo "Done! Restarting shell..."
exec "$SHELL"
