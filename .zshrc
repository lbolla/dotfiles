# See http://stackoverflow.com/questions/171563/whats-in-your-zshrc

#{{{ ZSH Modules
autoload -Uz promptinit compinit
promptinit
compinit
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
alias e=vi
alias lbollash='ssh lbolla.info'
alias lbollafs='mkdir -p /tmp/linode && sshfs lbolla.info:/ /tmp/linode'
alias pg='ps aux | grep'
alias -g G='| grep'
alias -g L='| less'
alias -s pdf=$PDFVIEWER
alias -s doc=$DOCVIEWER
#}}}

#{{{ Prompt
source ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1
export PROMPT='%B%(?..[%?] )%b%n@%U%m%u %F{${1:-green}}%~%f > '
export RPROMPT='$(__git_ps1 " (%s)")'
#}}}

#{{{ Bindings
bindkey -e
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
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
#}}}
