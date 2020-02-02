if (( $+commands[stern] )); then
    __STERN_COMPLETION_FILE="${ZSH_CACHE_DIR}/stern_completion"

    if [[ ! -f $__STERN_COMPLETION_FILE ]]; then
        stern --completion=zsh >! $__STERN_COMPLETION_FILE
    fi

    [[ -f $__STERN_COMPLETION_FILE ]] && source $__STERN_COMPLETION_FILE

    unset __STERN_COMPLETION_FILE
fi
