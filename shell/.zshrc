# Homebrew
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  BREW_PATH="/home/linuxbrew/.linuxbrew/bin/brew"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  BREW_PATH="/opt/homebrew/bin/brew"
fi
eval "$($BREW_PATH shellenv)"

# Functions
openu() { # Open URL
    open "https://$1"
}

groot() { # git repo root
    git rev-parse --show-toplevel
}

# Aliases
alias c="clear"
alias cdh="cd ~"
alias cdg='cd "$(groot)"'
alias res="exec $SHELL"
alias lg="lazygit"
alias venv="source .venv/bin/activate"

# Initializations
eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/config.json)"

# Fast Node Manager (fnm)
eval "$(fnm env --use-on-cd)"

# Rust
. "$HOME/.cargo/env"
