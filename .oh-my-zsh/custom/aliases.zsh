alias dockviz="docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock nate/dockviz"
alias docker-images-tree="dockviz images -t -l"
alias mkvirtualenv2="mkvirtualenv --python /usr/local/bin/python2"
alias mkvirtualenv3="mkvirtualenv --python /usr/local/bin/python3"
alias w=workon

IMAGEVIEWER=eog

alias -s gif=$IMAGEVIEWER
alias -s jpeg=$IMAGEVIEWER
alias -s jpg=$IMAGEVIEWER
alias -s JPG=$IMAGEVIEWER
alias -s json='jq . < '
alias -s png=$IMAGEVIEWER

unalias fd

function docker-images-children {
    for i in $(docker images -q)
    do
        docker history $i | grep -v $i | grep -q $1 && echo $i
    done | sort -u
}
