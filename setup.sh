#!/bin/bash

# Strict mode
set -euo pipefail
IFS=$'\n\t'

function link {
    echo $1
    ln -sf $HOME/src/dotfiles/$1 $HOME/$1
}

FILES=(
    .Xresources
    .emacs.d
    .psqlrc
    .pyrc
    .zshenv
    .zshrc
)

for f in ${FILES[@]}; do
	link $f
done

DIRS=(
    .virtualenvs
)

for d in ${DIRS[@]}; do
    mkdir -p $d
    for f in `ls $d`; do
        link $d/$f
    done
done
