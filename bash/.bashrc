# Path
export PATH=$PATH:~/.local/bin

# Aliases
alias c="clear"
alias cdh="cd ~"
alias res="exec $SHELL"
alias lg="lazygit"
alias venv="source .venv/bin/activate"

# Functions
groot() { # git repo root
  git rev-parse --show-toplevel
}

# Initializations
eval "$(oh-my-posh init bash --config ~/.config/oh-my-posh/config.json)"
