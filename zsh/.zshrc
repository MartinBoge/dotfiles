# Aliases
alias c="clear"
alias cdh="cd ~"
alias res="exec $SHELL"
alias lg="lazygit"
alias venv="source .venv/bin/activate"

# Functions
openu() {
    open "https://$1"
}

groot() { # git repo root
  git rev-parse --show-toplevel
}

# Init oh-my-posh
eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/config.json)"

# Complychain utility
ccu() {
  help() {
    echo "---- Complychain Utility (ccu) ----"
    echo ""
    echo "Global utility:"
    echo "  ccu g ss            Sync backend and frontend schema/types"
    echo ""
    echo "Frontend utility:"
    echo "  ccu f dev           Run dev server"
    echo ""
    echo "Backend utility:"
    echo "  ccu b run           Run server"
    echo "  ccu b res           Run sqlite reset, then create dummy data, then server"
    echo "  ccu b test          Run tests"
    echo "  ccu b tw            Run tailwind serve"
  }

  # Global utility
  if [[ $1 == "g" ]]; then
  
    if [[ $2 == "ss" ]]; then
      cd "$(groot)/backend"
      venv
      cd src
      python manage.py export_openapi_json

      cd "$(groot)/frontend"
      pnpm generate-api-backend-types

      cd "$(groot)"
    else
      help
    fi

  # Frontend utility
  elif [[ $1 == "f" ]]; then

    if [[ $2 == "dev" ]]; then
      cd "$(groot)/frontend"
      pnpm run dev

    else
      help
    fi

  # Backend utility
  # CONSIDER: Just cding into backend, activating venv and then cd into src... Might just be easier.
  elif [[ $1 == "b" ]]; then
  
    if [[ $2 == "run" ]]; then
      cd "$(groot)/backend"
      venv
      cd src
      python manage.py runserver

    elif [[ $2 == "test" ]]; then
      cd "$(groot)/backend"
      venv
      cd src
      python manage.py test

    elif [[ $2 == "res" ]]; then
      cd "$(groot)/backend"
      venv
      cd src
      python manage.py reset_sqlite
      python manage.py create_dummy_data
      python manage.py runserver

    elif [[ $2 == "tw" ]]; then
      cd "$(groot)/backend"
      pnpm run tailwind-serve

    else
      help
    fi

  else
    help
  fi
}
