#!/bin/bash

# Strict mode
set -euo pipefail
IFS=$'\n\t'

THIS_DIR=$(dirname "$0")

PACKAGES=(
    # X
    # awesome
    # bash
    bin
    emacs
    # fbcli
    git
    # lftp
    mime
    psql
    # python
    ripgrep
    rtorrent
    # rust
    systemd
    tmux
    # virtualenv
    # w3m
    zsh
)

pushd ${THIS_DIR}
stow -v -t $HOME ${PACKAGES[@]}
popd
