#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

create_symlink() {
    local src="$SCRIPT_DIR/$1"
    local dst="$2"
    
    if [ ! -e "$src" ]; then
        echo "$src doesn't exist"
        return 1
    fi

    # Clear destination path for symlink
    rm -f "$dst"
    
    # Ensure parent directories
    mkdir -p "$(dirname "$dst")"

    # Create symlink
    ln -s "$src" "$dst"
}
