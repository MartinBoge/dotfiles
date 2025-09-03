#!/bin/bash

echo "Installing dependencies via APT..."
sudo apt update
sudo apt upgrade -y
# sudo apt install -y \
#     package1 \
#     package2

echo "Sourcing utils..."
source utils.sh

echo "Setting up symlinks..."
create_symlink bash/.bashrc ~/.bashrc

echo "Done! Restarting shell..."
exec "$SHELL"
