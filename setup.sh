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
    psql
    python
    ripgrep
    virtualenv
    zsh
)

stow -v -t $HOME ${PACKAGES[@]}
