#!/bin/zsh

source utils.sh

create_symlink neovim/ ~/.config/nvim
create_symlink tmux/.tmux.conf ~/.tmux.conf
create_symlink zsh/.zshrc ~/.zshrc
create_symlink oh-my-posh/config.json ~/.config/oh-my-posh/config.json
