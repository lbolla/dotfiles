# If not running interactively, don't do anything
[ -z "$PS1" ] && return

BASH_ROOT=".bash"
for config in "vars" "prompt" "aliases" "go" "plan9"; do
        [ -f ${BASH_ROOT}/${config} ] && . ${BASH_ROOT}/${config}
done
