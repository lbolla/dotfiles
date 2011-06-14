# If not running interactively, don't do anything
[ -z "$PS1" ] && return

[ -f ~/.bash_vars ] && . ~/.bash_vars
[ -f ~/.bash_prompt ] && . ~/.bash_prompt
[ -f /etc/bash_completion ] && . /etc/bash_completion
[ -f ~/.git-completion.bash ] && . ~/.git-completion.bash
[ -f ~/.bash_aliases ] && . ~/.bash_aliases
[ -f ~/.bash_functions ] && . ~/.bash_functions
# [ -f ~/.bash_geneity ] && . ~/.bash_geneity
[ -f ~/.bash_radfactory ] && . ~/.bash_radfactory
[ -f ~/.bash_hadoop ] && . ~/.bash_hadoop
# [ -f ~/.bash_plan9 ] && . ~/.bash_plan9
# [ -f ~/.bash_go ] && . ~/.bash_go
