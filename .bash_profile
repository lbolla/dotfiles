# ~/.bash_profile: executed by bash(1) for login shells.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/login.defs
#umask 022

# include .bashrc if it exists
[ -f ~/.bashrc ] && . ~/.bashrc

# include other bin dirs
for d in "~/bin/" "/opt/java/jre/bin/" "~/.cabal/bin"; do
	[ -d $d ] && PATH="$d":"${PATH}"
done

# run fetchmail
# fetchmail

# Ruby stuff
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
