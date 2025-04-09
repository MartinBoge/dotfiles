# setup aliases
alias venv="source .venv/bin/activate"
alias res="exec $SHELL"

openu() {
    open "https://$1"
}

# init oh-my-posh
eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/config.json)"
