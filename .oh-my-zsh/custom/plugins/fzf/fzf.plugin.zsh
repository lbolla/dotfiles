if [[ -f $HOME/.fzf.zsh ]]; then
    source $HOME/.fzf.zsh
    export FZF_DEFAULT_COMMAND='rg --files'
fi
