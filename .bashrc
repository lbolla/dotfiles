# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# git bash completion
. /etc/bash_completion.d/git

BASH_ROOT=".bash"
for config in "vars" "prompt" "aliases"; do
        [ -f ${BASH_ROOT}/${config} ] && . ${BASH_ROOT}/${config}
done
