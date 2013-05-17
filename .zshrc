# See http://stackoverflow.com/questions/171563/whats-in-your-zshrc

#{{{ ZSH Modules
autoload -Uz promptinit compinit colors
promptinit
compinit
colors
#}}}

#{{{ Options
setopt AUTO_CD
setopt AUTO_PUSHD
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt PROMPT_SUBST
setopt RM_STAR_WAIT
setopt SHARE_HISTORY
#}}}

#{{{ Variables
export PATH=$HOME/bin:$PATH
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history
export EDITOR=vi
export PAGER=less
if [[ -x `which mupdf` ]]; then
    PDFVIEWER=mupdf
elif [[ -x `which evince` ]]; then
    PDFVIEWER=evince
fi
if [[ -x `which soffice` ]]; then
    DOCVIEWER=soffice
elif [[ -x `which evince` ]]; then
    DOCVIEWER=abiword
fi
#}}}

#{{{ Aliases
alias ls='ls --color'
alias l='ls -l --color'
alias ll='ls -la --color'
alias e=vim
alias linodesh='ssh lbolla.info'
alias linodefs='mkdir -p /tmp/linode && sshfs lbolla.info:/ /tmp/linode'
alias pg='ps aux | grep'
alias -g G='| grep'
alias -g L='| less'
alias -s pdf=$PDFVIEWER
alias -s doc=$DOCVIEWER
alias mutt-gmail='MUTT_PROFILE=gmail mutt'
alias mutt-networkscale='MUTT_PROFILE=networkscale mutt'
alias mutt-pispo='MUTT_PROFILE=pispo mutt'
alias mutt-pispo-customerservice='MUTT_PROFILE=pispo-customerservice mutt'
alias mutt-pispo-info='MUTT_PROFILE=pispo-info mutt'
alias mutt-reddeer='MUTT_PROFILE=reddeer mutt'
alias screen-mail='screen -S mail -c ~/.screenrc-mail'
#}}}

#{{{ Prompt
source ~/.git-prompt.sh
function __venv_ps1 {
    if [ "x$VIRTUAL_ENV" != "x" ]; then
        echo "[`basename $VIRTUAL_ENV`]"
    else
        echo ""
    fi
}

GIT_PS1_SHOWDIRTYSTATE=true
export PROMPT='%B%(?..[%?] )%b%n@%U%m%u %F%B%{$fg[yellow]%}%~%f%{$reset_color%}%b % > '
export RPROMPT='%B$(__git_ps1 " (%s)")%b %{$fg[green]%}$(__venv_ps1)%{$reset_color%}%'
#}}}

#{{{ Bindings
bindkey -e
bindkey '^b' backward-word
bindkey '^f' forward-word
#}}}

#{{{ External scripts
if [[ -x `which virtualenvwrapper.sh` ]]; then
    source `which virtualenvwrapper.sh`
    export PIP_REQUIRE_VIRTUALENV=true
    export PIP_RESPECT_VIRTUALENV=true
    export VIRTUAL_ENV_DISABLE_PROMPT=true
fi
#}}}

#{{{ Styles
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
#  zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
#}}}
