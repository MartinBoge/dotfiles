# dotfiles

### Getting started

1. Install [Nix](https://nixos.org/download/)
2. Clone: `git clone git@github.com:MartinBoge/dotfiles.git ~/dotfiles`
3. Go to Nix config: `cd ~/dotfiles/nix`
4. Rebuild:
   - For WSL: `sudo nix --extra-experimental-features 'nix-command flakes' run nixos-rebuild -- switch --flake .#wsl`
   - For Mac: `sudo nix --extra-experimental-features 'nix-command flakes' run nix-darwin -- switch --flake .#mac`
   - For NixOS: `sudo nix --extra-experimental-features 'nix-command flakes' run nixos-rebuild -- switch --flake .#nixos`
5. Enjoy!

### SSH Keygen

- Generate Ed25519 SSH key: `ssh-keygen -t ed25519 -C "comment"`
- Generate RSA SSH key: `ssh-keygen -t rsa -b 4096 -C "comment"`

### Resources

- [Vim Motions Training](https://www.vim-hero.com/)
- [Tmux Cheatsheet](https://tmuxcheatsheet.com/)

### To do / Ideas

- A way to persist or "setup" good tmux sessions. Maybe via aliases?
- Mark down previewer
- Mark down format (prettier)
- Write without formatting
- Closing last buffer should open neo-tree
- Can we avoid empty buffers?
- Rust support
- Support for html, js, ts, svelte
- Delete a buffer by number (i.e. a buffer that is currently not the one we have open)
- Better diagnostics. Squiqqly lines - easier way to show under the cursor, etc.
- Search and replace in multiple files (grug-far maybe?)
- Sessions?
- Dashboard?
- Git status within bufferline?
- Shortcut(s) to move buffer into ordinal position. E.g. <leader>bm1 should move the buffer to the ordinal position 1.
- Git blame on a given line.
- A way to see git blame on a change.
- Lazygit within neovim?
- Tmux theme same as tokyonight?
- Find out how we can "refactor"/"rename" a variable or function name
- Do we need treesitter? Do we already have treesitter?

### Neovim plugins to check out

- https://github.com/folke/ts-comments.nvim
- https://github.com/folke/trouble.nvim
- https://github.com/nvim-mini/mini.ai
- https://github.com/MagicDuck/grug-far.nvim
- https://github.com/folke/todo-comments.nvim
- https://github.com/mfussenegger/nvim-lint
- https://github.com/nvim-treesitter/nvim-treesitter
- https://github.com/windwp/nvim-ts-autotag
- https://github.com/coder/claudecode.nvim
- https://github.com/folke/persistence.nvim
- https://github.com/L3MON4D3/LuaSnip
- https://github.com/nvim-mini/mini.comment
- https://github.com/nvim-mini/mini.snippets
- https://github.com/ThePrimeagen/refactoring.nvim
