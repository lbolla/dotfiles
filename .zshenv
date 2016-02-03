export GOPATH=$HOME/src/go
export GOROOT=/opt/go
export PLAN9=/home/lbolla/src/plan9port

PATH=/opt/emacs/src:/opt/emacs/lib-src:/opt/cisco/anyconnect/bin:/opt/flow:/opt/node:$PATH
PATH=$GOPATH/bin:$GOROOT/bin:$PATH
PATH=$HOME/bin:$HOME/.cabal/bin:$HOME/src/cmd:$HOME/node_modules/.bin/:$HOME/.cache/rebar3/bin:$PLAN9/bin:$PATH
export PATH

if [[ -z $XDG_CURRENT_DESKTOP ]]; then
    # Terminal
    export TERM=linux
else
    # Inside X
    export TERM=xterm-256color
fi
