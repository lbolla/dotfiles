#!/bin/bash

# Strict mode
set -euo pipefail
IFS=$'\n\t'

PACKAGES=(
    X
    awesome
    bash
    bin
    emacs
    fbcli
    git
    lftp
    mime
    psql
    python
    ripgrep
    rust
    tmux
    virtualenv
    w3m
    zsh
)

stow -v -t $HOME ${PACKAGES[@]}
