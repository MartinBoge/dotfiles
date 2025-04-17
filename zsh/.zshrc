# setup aliases
alias c="clear"
alias cdh="cd ~"
alias res="exec $SHELL"
alias venv="source .venv/bin/activate"

openu() {
    open "https://$1"
}

# init oh-my-posh
eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/config.json)"
