#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

create_symlink() {
    local src="$SCRIPT_DIR/$1"
    local dst="$2"
    
    if [ ! -e "$src" ]; then
        echo "$src doesn't exist"
        return 1
    fi

    # Remove broken symlink
    if [ -L "$dst" ] && [ ! -e "$dst" ]; then
        rm "$dst"
    fi

    # Create symlink if destination doesn't exist
    if [ ! -e "$dst" ] && [ ! -L "$dst" ]; then
        mkdir -p "$(dirname "$dst")"
        ln -s "$src" "$dst"
    fi
}
