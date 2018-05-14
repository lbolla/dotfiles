#!/bin/bash

# Strict mode
set -euo pipefail
IFS=$'\n\t'

PACKAGES=(
    awesome
    bash
    emacs
    git
    oh-my-zsh
    psql
    python
    ripgrep
    virtualenv
    X
    zsh
)

stow -t $HOME ${PACKAGES[@]}
