# Homebrew
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

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

# Rust
. "$HOME/.cargo/env"
