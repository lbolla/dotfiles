# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# git bash completion
for git_compl in "/etc/bash_completion.d/git" "/usr/share/git/completion/git-completion.bash"; do
        [ -f ${git_compl} ] && . ${git_compl}
done

BASH_ROOT=".bash"
for config in "vars" "prompt" "aliases"; do
        [ -f ${BASH_ROOT}/${config} ] && . ${BASH_ROOT}/${config}
done
