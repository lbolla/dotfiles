# If not running interactively, don't do anything
[ -z "$PS1" ] && return

#
# VARIABLES
#

# If this is an xterm use colors
case "$TERM" in
xterm*|rxvt*|screen)
    USE_COLORS=Y
    ;;
esac
# don't like colors...
USE_COLORS=N

export PATH=~/bin:$PATH
export GIT_EDITOR="vi"

# vi keybindings for bash
# set -o vi

# enable color support of ls
eval "`dircolors -b`"

# don't put duplicate lines in the history
export HISTCONTROL=ignoredups

# for gpg
export GPG_TTY=`tty`

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you git in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi


#
# PROMPT 
#

#Comment in the above and uncomment this below for a color prompt
if [ "x$USE_COLORS" = "xY" ]; then
	PS1='\n${debian_chroot:+($debian_chroot)}\[\033[01;33m\]\u@\h\[\033[00m\]:\[\033[01;35m\]\w\[\033[00m\] $(__git_ps1 "(%s)")\n\$ '
else
	PS1='\n${debian_chroot:+($debian_chroot)}\u@\h:\w $(__git_ps1 "(%s)")\n\$ '
fi


# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*|screen)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007" '
    ;;
*)
    ;;
esac


#
# AUTOCOMPLETION
#

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi


#
# PLAN9
#

if [ -f ~/.bash_plan9 ]; then
    . ~/.bash_plan9
fi


#
# ALIAS
#

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


#
# FUNCTIONS
#

if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi


#
# Geneity
#

# VARIABLES
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/capscan/mcd5cs/lib/
# export MAIL=$HOME/mail/inbox
export MCS_INI_PATH=/opt/capscan/mcd5cs/conf/spider.ini
# export PYTHONPATH=../../python:../../../python/lib:../../../python/appserv:$PYTHONPATH
export PYTHONSTARTUP=~/bin/python_shell_startup.py
export SQLPATH=$HOME

# ORACLE
if [ `hostname` == 'muttley' ]; then
	export ORACLE_HOME=/opt/oracle/app/oracle/oracle/product/10.2.0/db_1/
	export ORACLE_SID=ORA10G
else
	export ORACLE_HOME=/usr/lib/oracle/xe/app/oracle/product/10.2.0/server
	export ORACLE_SID=XE
fi;

#export NLS_LANG=`$ORACLE_HOME/bin/nls_lang.sh`
export LD_LIBRARY_PATH=$ORACLE_HOME/lib:$LD_LIBRARY_PATH
export PATH=$ORACLE_HOME/bin:$PATH

# GO
export GOROOT=$HOME/src/go
export GOARCH=386
export GOOS=linux
