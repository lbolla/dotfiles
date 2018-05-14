#!/bin/bash

# Strict mode
set -euo pipefail
IFS=$'\n\t'

PACKAGES=(
    X
    awesome
    bash
    emacs
    git
    oh-my-zsh
    psql
    python
    ripgrep
    virtualenv
    zsh
)

stow -t $HOME ${PACKAGES[@]}
