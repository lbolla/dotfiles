#!/bin/bash

# Strict mode
set -euo pipefail
IFS=$'\n\t'

PACKAGES=(
    X
    ack
    awesome
    bash
    emacs
    fbcli
    git
    gmrun
    hg
    indent
    javascript
    psql
    python
    ripgrep
    splint
    tmux
    vim
    virtualenv
    w3m
    zsh
)

stow -v -t $HOME ${PACKAGES[@]}
