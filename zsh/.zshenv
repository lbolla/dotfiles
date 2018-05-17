# export ALTERNATE_EDITOR=vim
export BROWSER=firefox
# export BROWSER=google-chrome
export EDITOR='emacsclient -nw'
# export EDITOR='vim'
export GOPATH=$HOME/src/go
export GOROOT=/opt/go
export LESS="-R"
export MAIL=$HOME/Mail/YG/INBOX/
export PAGER=less
export PGCLUSTER="9.6/main"  # Use latest PG
export PIP_REQUIRE_VIRTUALENV=true
export PIP_RESPECT_VIRTUALENV=true
export PLAN9=/home/lbolla/src/plan9port
export PYTHONHASHSEED=random
export PYTHONSTARTUP=$HOME/.pyrc
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc
export RUST_SRC_PATH=~/.multirust/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src
# export RUST_SRC_PATH=~/.multirust/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src
export CARGO_INCREMENTAL=1
export VIRTUAL_ENV_DISABLE_PROMPT=true
export PATSHOME=/usr/local/lib/ats2-postiats-0.3.3
export DISABLE_VENV_CD=1
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export XIVIEWER=feh
export KUBECONFIG=$HOME/src/yougov/devops/kubernetes/client/config
export MAILDIR=$HOME/Mail

PATH=/opt/emacs/src:/opt/emacs/lib-src:/opt/cisco/anyconnect/bin:/opt/flow:/opt/node/bin:$PATH
PATH=$GOPATH/bin:$GOROOT/bin:$PATH
PATH=$HOME/.cargo/bin:$PATH
PATH=$HOME/bin:$HOME/.local/bin:$HOME/.cache/rebar3/bin:$HOME/.cabal/bin:$HOME/src/cmd:$HOME/node_modules/.bin/:$HOME/.cache/rebar3/bin:$PATH
export PATH

if [[ `tty` = /dev/tty* ]]
then
    # Terminal
    export IN_X="no"
    export TERM=linux
    # Nice terminal colors
    # http://askubuntu.com/questions/147462/how-can-i-change-the-tty-colors
    #  echo -en "\e]P0232323" # black
    echo -en "\e]P0000000" # black
    echo -en "\e]P82B2B2B" # darkgrey
    echo -en "\e]P1D75F5F" # darkred
    echo -en "\e]P9E33636" # red
    echo -en "\e]P287AF5F" # darkgreen
    echo -en "\e]PA98E34D" # green
    echo -en "\e]P3D7AF87" # brown
    echo -en "\e]PBFFD75F" # yellow
    echo -en "\e]P48787AF" # darkblue
    echo -en "\e]PC7373C9" # blue
    echo -en "\e]P5BD53A5" # darkmagenta
    echo -en "\e]PDD633B2" # magenta
    echo -en "\e]P65FAFAF" # darkcyan
    echo -en "\e]PE44C9C9" # cyan
    echo -en "\e]P7E5E5E5" # lightgrey
    echo -en "\e]PFFFFFFF" # white
    # clear # for background artifacting
else
    export IN_X="yes"
    if [[ -n $INSIDE_EMACS ]]
    then
            export TERM=dumb
    else
            export TERM=xterm-256color
    fi
fi
