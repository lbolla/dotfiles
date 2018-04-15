if type "fzf" > /dev/null
then

    if type "rg" > /dev/null
    then
        export FZF_DEFAULT_COMMAND='rg --files'
    fi

    if [[ -f $HOME/.fzf.zsh ]]
    then
        source $HOME/.fzf.zsh
    fi

    if [[ -f /usr/share/doc/fzf/completion.zsh ]]
    then
        source /usr/share/doc/fzf/completion.zsh
    fi

    if [[ -f /usr/share/doc/fzf/key-bindings.zsh ]]
    then
        source /usr/share/doc/fzf/key-bindings.zsh
    fi

fi
