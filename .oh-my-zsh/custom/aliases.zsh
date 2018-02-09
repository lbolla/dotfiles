alias -g GV="| grep -v"
alias -g J="| jq ."
alias -g S="| sort"
alias -g SN="| sort -n"
alias -g T="| tar t"
alias -g U="| sort | uniq -c"
alias -g UN="| sort -n | uniq -c"

alias dockviz="docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock nate/dockviz"
alias docker-images-tree="dockviz images -t -l"
alias mkvirtualenv2="mkvirtualenv --python /usr/local/bin/python2"
alias mkvirtualenv3="mkvirtualenv --python /usr/local/bin/python3"
alias w=workon

alias -s gz="gunzip -c"
alias -s json="jq . <"
alias -s pdf="evince"
alias -s tgz="tar tf"

# We want this: https://github.com/sharkdp/fd
unalias fd

function docker-images-children {
    for i in $(docker images -q)
    do
        docker history $i | grep -v $i | grep -q $1 && echo $i
    done | sort -u
}
