# export CARGO_INCREMENTAL=1
# export DISABLE_VENV_CD=1
# export GO111MODULE=auto
# export GOPATH=$HOME
# export KUBE_PS1_ENABLED=true
# export MAIL=$HOME/Mail/YG/INBOX/
# export PGCLUSTER="9.6/main"  # Use latest PG
# export PIP_REQUIRE_VIRTUALENV=true
# export PIP_RESPECT_VIRTUALENV=true
# export PLAN9=/home/lbolla/src/plan9port
# export PYTHONWARNINGS=default
# export RUST_SRC_PATH=~/.multirust/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src
# export RUST_SRC_PATH=~/.multirust/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src
# python3 -c "import virtualenvwrapper" &> /dev/null && export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export BROWSER=firefox
export ERL_AFLAGS="-kernel shell_history enabled"
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --info=inline --border"
export HELM_V3_CONFIG=$HOME/.helm3
export HELM_V3_DATA=$PWD/.helm3-data
export LESS="-R"
export MAILDIR=$HOME/Mail
export NVM_LAZY=1
export PAGER=less
export PATSHOME=/usr/local/lib/ats2-postiats-0.3.3
export PGTZ=utc
export PYTHONHASHSEED=random
export REPORTTIME=3
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc
export RUST_BACKTRACE=1
export VIRTUAL_ENV_DISABLE_PROMPT=true
export WORKON_HOME=$HOME/.virtualenvs
export XIVIEWER=xdg-open
if [ -f ${HOME}/.pyrc ]; then
    export PYTHONSTARTUP=$HOME/.pyrc
fi

if [[ -n "$DISPLAY" ]]
then
    export IN_X="yes"
    export TERM=xterm-256color
else
    export IN_X="no"
    export TERM=linux
fi

if [[ -n "$INSIDE_EMACS" ]]
then
    export TERM=dumb
else
    export ALTERNATE_EDITOR="vi"
    export EDITOR="emacsclient -nw --alternate-editor ${ALTERNATE_EDITOR}"
    export VISUAL="emacsclient --socket-name /run/user/$(id -u)/emacs/server"
fi

if [[ -f "$HOME/.cargo/env" ]]
then
    . "$HOME/.cargo/env"
fi
