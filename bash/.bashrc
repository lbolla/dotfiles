# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias nocaps='sudo dumpkeys | tail -n +2 | sed "s/\s*58\s*=\s*Caps_Lock/ 58 = Control/" | sudo loadkeys'

PS1='[\u@\h \W]\$ '
