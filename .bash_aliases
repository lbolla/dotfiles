# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    alias dir='ls --color=auto --format=vertical'
    alias vdir='ls --color=auto --format=long'
fi

# some more ls aliases
alias ll='ls -la'
alias la='ls -A'
alias l='ls -CF'

alias rm='rm -i'
# alias rmtilde='rm -f *~ .*~' # dangerous
alias c='clear' # same as ctrl-l
alias grep='grep --color'
alias mutt='/usr/bin/getmail; mutt'

alias pycheck='pychecker -e Style --no-shadow'
alias exact_time='curl http://tycho.usno.navy.mil/cgi-bin/timer.pl --stderr /dev/null | grep UTC | sed "s/<BR>//"'

alias t='todo.sh -d .todo/todorc'
