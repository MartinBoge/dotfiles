# dotfiles

### Mac Installation

Prerequisites:

- [Homebrew](https://brew.sh)

Steps:

1. Clone repo: `git clone git@github.com:MartinBoge/dotfiles.git`
2. Install dependencies and setup configs: `./mac.zsh`

Extra (optional):

- Ensure tmux installs plugins, start a tmux session `tmux new` and then `ctrl + a` followed by `I` to install
- Ensure libpq is added to path via: `brew link --force libpq`

### Ubuntu

Steps:

1. Clone repo: `git clone git@github.com:MartinBoge/dotfiles.git`
2. Install dependencies and setup configs: `./ubuntu.sh`

### SSH Keygen

- Generate Ed25519 SSH key: `ssh-keygen -t ed25519 -C "comment"`
- Generate RSA SSH key: `ssh-keygen -t rsa -b 4096 -C "comment"`
