source ~/dotfiles/shell/local.sh

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

export CLAUDE_CODE_USE_FOUNDRY="1"
export ANTHROPIC_FOUNDRY_RESOURCE="proj-cc24-internal"
export ANTHROPIC_DEFAULT_OPUS_MODEL="claude-opus-4-5"
export ANTHROPIC_DEFAULT_SONNET_MODEL="claude-sonnet-4-5"
export ANTHROPIC_DEFAULT_HAIKU_MODEL="claude-haiku-4-5"
# export ANTHROPIC_FOUNDRY_API_KEY="" set in local.sh

export PATH="$HOME/.cargo/bin:$PATH"
source "/etc/profiles/per-user/$USER/etc/profile.d/hm-session-vars.sh"
