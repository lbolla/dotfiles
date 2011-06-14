# ~/.bash_profile: executed by bash(1) for login shells.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/login.defs
#umask 022

# include .bashrc if it exists
[ -f ~/.bashrc ] && . ~/.bashrc

# include other bin dirs
[ -d ~/bin ] && PATH=~/bin:"${PATH}"
[ -d /opt/local/bin ] && PATH=/opt/local/bin:"${PATH}"
[ -d /opt/local/sbin ] && PATH=/opt/local/sbin:"${PATH}"
