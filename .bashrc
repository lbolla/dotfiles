# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you git in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

## set a fancy prompt (non-color, unless we know we "want" color)
#case "$TERM" in
#xterm-color)
#        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#        ;;
#*)
#        PS1='\n${debian_chroot:+($debian_chroot)}\u@\h:\w\n\$ '
#        ;;
#esac

# Comment in the above and uncomment this below for a color prompt
PS1='\n${debian_chroot:+($debian_chroot)}\[\033[01;33m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n\$ '
#export PS1="\[]1;\h]2;\h\n\033[40;31;1m\]--- \[\033[40;33;1m\]\h\[\033[40;32;1m\] \w\[\033[40;31;1m\] ---\n\[\033[40;32;1m\]\!\[\033[40;31;1m\] \$ \[\033[0m\]"

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007" '
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

if [ `hostname` == 'muttley' ]; then
	export ORACLE_HOME=/opt/oracle/app/oracle/oracle/product/10.2.0/db_1/
	export ORACLE_SID=ORA10G
else
	export ORACLE_HOME=/usr/lib/oracle/xe/app/oracle/product/10.2.0/server
	export ORACLE_SID=XE
fi;

#export NLS_LANG=`$ORACLE_HOME/bin/nls_lang.sh`
export LD_LIBRARY_PATH=$ORACLE_HOME/lib:$LD_LIBRARY_PATH
export PATH=$ORACLE_HOME/bin:~/bin:$PATH:~/git/python/bin

function sqlplus {
	rlwrap sqlplus $*
}

export PYTHONPATH=$PYTHONPATH:~/git/python/lib:~/git/python/as:~/git/betfair_api/bf_lib

export PYVER=2.5

function python {
	python$PYVER $*
}

export SQLPATH=$HOME

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/capscan/mcd5cs/lib/
export MCS_INI_PATH=/opt/capscan/mcd5cs/conf/spider.ini

export PYTHONSTARTUP=~/bin/python_shell_startup.py
