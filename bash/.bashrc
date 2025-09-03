# Aliases
alias c="clear"
alias cdh="cd ~"
alias res="exec $SHELL"
alias lg="lazygit"
alias venv="source .venv/bin/activate"

# Functions
openu() {
    xdg-open "https://$1"
}

groot() { # git repo root
  git rev-parse --show-toplevel
}
