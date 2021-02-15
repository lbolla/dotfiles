alias -g GV="| grep -v"
alias -g J="| jq ."
alias -g S="| sort"
alias -g SN="| sort -n"
# alias -g T="| tar t"
alias -g U="| sort | uniq -c"
alias -g UN="| sort -n | uniq -c"

alias dockviz="docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock nate/dockviz"
alias docker-images-tree="dockviz images -t -l"
PYTHON_VERSIONS=(
    2
    3
    3.6
    3.7
    3.8
    3.9
)
for v in ${PYTHON_VERSIONS[@]}; do
    python_exe="python${v}"
    if command -v ${python_exe} > /dev/null; then
        alias mkvirtualenv${v}="mkvirtualenv --python `which ${python_exe}`"
    fi
done

# alias mkvirtualenv-pypy2="mkvirtualenv --python /opt/pypy-6.0.0-linux_x86_64-portable/bin/pypy"
# alias mkvirtualenv-pypy3="mkvirtualenv --python /opt/pypy3.5-6.0.0-linux_x86_64-portable/bin/pypy"
# alias nocaps='sudo dumpkeys | tail -n +2 | sed "s/\s*58\s*=\s*Caps_Lock/ 58 = Control/" | sudo loadkeys'
# unalias t; alias t=tmux
alias psc="ps xawf -eo ppid,pid,user,cgroup,args"
alias ungron="gron --ungron"
# alias w=workon
alias youtube-dl-song="youtube-dl --force-ipv4 -x -f 'bestaudio[ext=m4a]/best[ext=mp4]/best' -o '%(title)s.%(ext)s'"
alias youtube-dl-playlist="youtube-dl --force-ipv4 -x -f 'bestaudio[ext=m4a]/best[ext=mp4]/best' -o '%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s'"

alias -s epub="FBReader"
alias -s gz="gunzip -c"
alias -s json="jq . <"
alias -s pdf="xdg-open"
alias -s tgz="tar tf"
alias -s xlsx="libreoffice"
alias -s doc="libreoffice"
_media_fts=(ape avi flv m4a mkv mov mp3 mpeg mpg ogg ogm rm wav webm)
for ft in $_media_fts; do alias -s $ft=mpv; done

alias vcs-resolve="${HOME}/src/github.com/lbolla/vcs-resolve/vcs-resolve.py"
alias protonvpn="sudo ${HOME}/.virtualenvs/protonvpn/bin/protonvpn"

function docker-images-children {
    for i in $(docker images -q)
    do
        docker history $i | grep -v $i | grep -q $1 && echo $i
    done | sort -u
}

# Don't want history shared across terminals
unsetopt inc_append_history
unsetopt share_history

# Emacs clever alias
unalias e 2> /dev/null
function e {
    args=${@:-.}
    if [[ "$IN_X" = "yes" ]]
    then
        $HOME/.oh-my-zsh/plugins/emacs/emacsclient.sh --no-wait ${args}
    else
        te ${args}
    fi
}

function setup_emacs {
    curl -s https://raw.githubusercontent.com/lbolla/dotfiles/master/emacs/bootstrap-dev.sh | sh
}

# From https://superuser.com/questions/285381/how-does-the-tmux-color-palette-work
function list-colors-display {
    for i in {0..255}; do
        printf "\x1b[38;5;${i}mcolour${i}\x1b[0m\n"
    done
}

function maybe-tmux-rename-window {
    if [[ -n "$TMUX" ]]; then
        tmux rename-window $1
    fi
}

unalias z 2> /dev/null
function z {
    if [[ $# -eq 0 ]]; then
        dir="$(_z 2>&1 | awk '{$1 = ""; print $0}' | sed 's/^ //g' | fzf -1 -0 --no-sort +m --tac)"
        [[ -n "$dir" ]] && cd "$dir" && maybe-tmux-rename-window $(basename "$dir")
    else
        _z $@ && maybe-tmux-rename-window ${@: -1}
    fi
}

function w {
    if [[ $# -eq 0 ]]; then
        what="$(workon | fzf -1 -0 --no-sort +m --tac)"
        [[ -n "${what}" ]] && workon "${what}"
    else
        workon ${what}
    fi
}
