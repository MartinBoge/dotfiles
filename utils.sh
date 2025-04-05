#!/bin/sh

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

create_symlink() {
    srz="$SCRIPT_DIR/$1"
    dst=$2
    if [ ! -e $srz ]; then
        echo "$srz doesn't exist"
    fi

    # check if symlink but not dst
    if [ -L "$dst" ] && [ ! -e "$dst" ]; then
        rm "$dst"
    fi

    # check if not dst and not symlink
    if [ ! -e "$dst" ] && [ ! -L "$dst" ]; then
        mkdir -p "$(dirname "$dst")" # ensure parent dirs
        ln -s "$srz" "$dst"
    fi
}
