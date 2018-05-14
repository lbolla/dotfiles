#Comment in the above and uncomment this below for a color prompt
if [ "x$VIRTUAL_ENV" = "x" ]; then
	if [ "x$USE_COLORS" = "xY" ]; then
		PS1='\n${debian_chroot:+($debian_chroot)}\[\033[01;33m\]\u@\h\[\033[00m\]:\[\033[01;37m\]\w\[\033[00m\] $(__git_ps1 "(%s)")\n\$ '
	else
		PS1='\n${debian_chroot:+($debian_chroot)}\u@\h:\w $(__git_ps1 "(%s)")\n\$ '
	fi
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*|screen*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007" '
    ;;
*)
    ;;
esac

