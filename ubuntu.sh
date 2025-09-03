#!/bin/bash

echo "Installing dependencies via Homebrew..."
# TODO

echo "Sourcing utils..."
source utils.sh

echo "Setting up symlinks..."
create_symlink bash/.bashrc ~/.bashrc

echo "Done!"
