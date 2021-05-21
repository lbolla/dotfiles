export BROWSER=firefox
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --info=inline --border"
export GOPATH=$HOME
export GO111MODULE=auto
export LESS="-R"
export MAIL=$HOME/Mail/YG/INBOX/
export PAGER=less
export PGTZ=utc
# export PGCLUSTER="9.6/main"  # Use latest PG
# export PIP_REQUIRE_VIRTUALENV=true
# export PIP_RESPECT_VIRTUALENV=true
# export PLAN9=/home/lbolla/src/plan9port
export PYTHONHASHSEED=random
if [ -f ${HOME}/.pyrc ]; then
    export PYTHONSTARTUP=$HOME/.pyrc
fi
# export PYTHONWARNINGS=default
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc
export RUST_BACKTRACE=1
export RUST_SRC_PATH=~/.multirust/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src
# export RUST_SRC_PATH=~/.multirust/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src
export CARGO_INCREMENTAL=1
export VIRTUAL_ENV_DISABLE_PROMPT=true
export PATSHOME=/usr/local/lib/ats2-postiats-0.3.3
export DISABLE_VENV_CD=1
export WORKON_HOME=$HOME/.virtualenvs
python3 -c "import virtualenvwrapper" &> /dev/null && export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export XIVIEWER=xdg-open
export MAILDIR=$HOME/Mail
export HELM_V3_CONFIG=$HOME/.helm3
export HELM_V3_DATA=$PWD/.helm3-data
export NVM_LAZY=1
# export KUBE_PS1_ENABLED=true

# Enable Erlang shell history
export ERL_AFLAGS="-kernel shell_history enabled"

# Void sources /etc/profile *after* .zshenv, overriding $PATH. Reset in .zshrc

if [[ -n "$DISPLAY" ]]
then
    export IN_X="yes"
    export TERM=xterm-256color
else
    export IN_X="no"
    export TERM=linux
    # If running interactively, set nice colors
    if [[ $- = *i* ]]
    then
        # Nice terminal colors
        # http://askubuntu.com/questions/147462/how-can-i-change-the-tty-colors
        # Color codes:
        #    e]P -> escape
        #    x -> 0..F color to modify
        #    RRGGBB -> hex color

        # echo -en "\e]P0232323" # black
        # echo -en "\e]P82B2B2B" # darkgrey
        # echo -en "\e]P1D75F5F" # darkred
        # echo -en "\e]P9E33636" # red
        # echo -en "\e]P287AF5F" # darkgreen
        # echo -en "\e]PA98E34D" # green
        # echo -en "\e]P3D7AF87" # brown
        # echo -en "\e]PBFFD75F" # yellow
        # echo -en "\e]P48787AF" # darkblue
        # echo -en "\e]PC7373C9" # blue
        # echo -en "\e]P5BD53A5" # darkmagenta
        # echo -en "\e]PDD633B2" # magenta
        # echo -en "\e]P65FAFAF" # darkcyan
        # echo -en "\e]PE44C9C9" # cyan
        # echo -en "\e]P7E5E5E5" # lightgrey
        # echo -en "\e]PFFFFFFF" # white
        # clear # for background artifacting

        # echo -en "\e]P0000000" # black
        # echo -en "\e]P1FF0000" # red
        # echo -en "\e]P200FF00" # green
        # echo -en "\e]P3FFFF00" # yellow
        # echo -en "\e]P40000FF" # blue
        # echo -en "\e]P5D633B2" # magenta
        # echo -en "\e]P644C9C9" # cyan
        # echo -en "\e]P7E5E5E5" # grey
        # echo -en "\e]P82B2B2B" # darkgrey
        # echo -en "\e]P9FF0000" # darkred
        # echo -en "\e]PA00FF00" # darkgreen
        # echo -en "\e]PBFFFF00" # darkyellow
        # echo -en "\e]PC0000FF" # darkblue
        # echo -en "\e]PDD633B2" # darkmagenta
        # echo -en "\e]PE44C9C9" # darkcyan
        # echo -en "\e]PF2B2B2B" # darkgrey

    fi
fi

if [[ -n "$INSIDE_EMACS" ]]
then
    export TERM=dumb
else
    export EDITOR="emacsclient -nw --alternate-editor nano"
    export VISUAL="emacsclient --socket-name /run/user/$(id -u)/emacs/server"
    export ALTERNATE_EDITOR="nano"
fi
