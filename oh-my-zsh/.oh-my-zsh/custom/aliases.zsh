alias -g GV="| grep -v"
alias -g J="| jq ."
alias -g S="| sort"
alias -g SN="| sort -n"
# alias -g T="| tar t"
alias -g U="| sort | uniq -c"
alias -g UN="| sort -n | uniq -c"

alias dockviz="docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock nate/dockviz"
alias docker-images-tree="dockviz images -t -l"
alias mkvirtualenv2="mkvirtualenv --python `which python2`"
alias mkvirtualenv3="mkvirtualenv --python `which python3`"
alias mkvirtualenv36="mkvirtualenv --python `which python3.6`"
alias mkvirtualenv37="mkvirtualenv --python `which python3.7`"
alias mkvirtualenv38="mkvirtualenv --python `which python3.8`"
# alias mkvirtualenv-pypy2="mkvirtualenv --python /opt/pypy-6.0.0-linux_x86_64-portable/bin/pypy"
# alias mkvirtualenv-pypy3="mkvirtualenv --python /opt/pypy3.5-6.0.0-linux_x86_64-portable/bin/pypy"
# alias nocaps='sudo dumpkeys | tail -n +2 | sed "s/\s*58\s*=\s*Caps_Lock/ 58 = Control/" | sudo loadkeys'
# unalias t; alias t=tmux
alias ssh='TERM=xterm ssh'
alias ungron="gron --ungron"
# alias w=workon
alias youtube-dl-song="youtube-dl -x -f 'bestaudio[ext=m4a]/best[ext=mp4]/best' -o '%(title)s.%(ext)s'"
alias youtube-dl-playlist="youtube-dl -x -f 'bestaudio[ext=m4a]/best[ext=mp4]/best' -o '%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s'"

alias -s epub="FBReader"
alias -s gz="gunzip -c"
alias -s json="jq . <"
alias -s pdf="xdg-open"
alias -s tgz="tar tf"
alias -s xlsx="libreoffice"
alias -s doc="libreoffice"

alias aws="/home/lbolla/.virtualenvs/aws-shell/bin/aws"
alias aws-shell="/home/lbolla/.virtualenvs/aws-shell/bin/aws-shell"
# alias fb="/home/lbolla/.virtualenvs/fbcli/bin/fb"
alias rust-update="/home/lbolla/src/cmd/rust-update"
alias vcs-resolve="/home/lbolla/src/github.com/lbolla/vcs-resolve/vcs-resolve.py"

alias lbolla-tmux='mosh lbolla.info tmux attach'

# alias vpn='sudo openvpn --config /home/lbolla/Private/vpn/AirVPN_Europe_UDP-443.ovpn --up "/home/lbolla/Private/vpn/bt-nameserver off" --down "/home/lbolla/Private/vpn/bt-nameserver on"'
alias vpn='sudo openvpn --config /home/lbolla/Private/vpn/AirVPN_Europe_UDP-443.ovpn'
alias protonvpn='sudo /home/lbolla/.virtualenvs/protonvpn/bin/protonvpn'

# We want this: https://github.com/sharkdp/fd
unalias fd

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
unalias e
function e {
    args=${@:-.}
    if [[ "$IN_X" = "yes" ]]
    then
        $HOME/.oh-my-zsh/plugins/emacs/emacsclient.sh --no-wait ${args}
    else
        te ${args}
    fi
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

function w {
    if [[ $# -eq 0 ]]; then
        workon
    else
        workon $1
        if [[ $? -eq 0 ]]; then
            maybe-tmux-rename-window $1
        fi
    fi
}

function fb {
    maybe-tmux-rename-window fb
    /home/lbolla/.virtualenvs/fbcli/bin/fb $*
}
