#!/bin/sh

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

create_symlink() {
    srz="$SCRIPT_DIR/$1"
    dst=$2
    if [ ! -e $srz ]; then
        echo "$srz doesn't exist"
    fi

    # create the parent directories if they don't exist
    dst_dir="$(dirname "$dst")"
    if [ ! -d "$dst_dir" ]; then
        mkdir -p "$dst_dir"
    fi

    if [ ! -e $dst ]; then
        if [ -L $dst ]; then # this infers a broken symlink
            rm $dst
        fi
        ln -s $srz $dst
    fi
}
