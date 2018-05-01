#!/bin/bash

# Strict mode
set -euo pipefail
IFS=$'\n\t'

DOTDIR=${HOME}/src/dotfiles

function link {
    echo $1
    ln -sf ${DOTDIR}/$1 -t ${HOME}
}

FILES=(
    .Xresources
    .emacs.d
    .gitconfig
    .psqlrc
    .pylintrc
    .pyrc
    .ripgreprc
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
    mkdir -p ${HOME}/$d
    for f in `ls ${DOTDIR}/$d`; do
        link $d/$f
    done
done
