# ~/.bash_profile: executed by bash(1) for login shells.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/login.defs
#umask 022

# include .bashrc if it exists
[ -f ~/.bashrc ] && . ~/.bashrc

# set PATH so it includes user's private bin if it exists
[ -d ~/bin ] && PATH=~/bin:"${PATH}"
