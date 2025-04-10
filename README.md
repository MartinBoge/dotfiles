# dotfiles

### Mac Installation

Prerequisites:

- [Homebrew](https://brew.sh)

Steps:

1. Clone repo: `git clone git@github.com:MartinBoge/dotfiles.git`.
2. Install dependencies via Brewfile: `brew bundle`.
3. Setup configs: `source mac.zsh`.

Extra (optional):

- Ensure tmux installs plugins, start a tmux session `tmux new` and then `ctrl + a` followed by `I` to install.
- Ensure libpq is added to path via: `brew link --force libpq`.
