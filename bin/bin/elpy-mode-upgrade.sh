#!/bin/bash

# Strict mode
set -euo pipefail
IFS=$'\n\t'

echo "Upgrading elpy-mode deps in $VIRTUAL_ENV"

PACKAGES=(
    elpy
    jedi
    # autopep8
    # yapf
    # black
    flake8
)

pip install --upgrade ${PACKAGES[@]}
