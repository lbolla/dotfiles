# colorize commands
if [ "x$USE_COLORS" = "xY" ]; then
	alias ls='ls --color=auto'
	alias grep='grep --color=auto'
	#  alias ipython='ipython -colors LightBG'
else
	alias ls='ls --color=never'
	alias grep='grep --color=never'
	alias ipython='ipython -colors NoColor'
fi

# ls aliases
alias l='ls -1F'
alias lf='ls -1f'
alias ll='l -1la'
alias lc='l -1C'

# for safety
alias rm='rm -i'

# grep
alias greperr='grep -e ERROR -e CRITICAL'
alias grepwarn='grep -e ERROR -e CRITICAL -e WARNING'

# python
alias python='python2.5'
alias pycheck='pychecker -e Style --no-shadow'

# rlwrap
alias sqlplus='rlwrap -m sqlplus'
alias sbcl='rlwrap -m sbcl'

#  alias screen='screen -T vt100'
#  alias f='find'
#  alias g='grep'
#  alias h='history'
#  alias p='ps aux'
#  alias pg='ps aux | grep'
alias s='screen'

alias vimtags='etags -R -f ~/.vim/tags/TAGS'
#  alias mutt='/usr/bin/getmail; mutt'
alias sup='sup-mail'
alias gmail='mutt -f imaps://lbolla@imap.gmail.com'
alias exact_time='curl http://tycho.usno.navy.mil/cgi-bin/timer.pl --stderr /dev/null | grep UTC | sed "s/<BR>//"'

# newsreader
alias news='tin -A -r'

# jabber
alias jabber='mcabber'
alias bf-jabber='mcabber -f ~/.mcabber/mcabberrc.bf'

# plan9
alias 9term='9term -s'
alias 9t='SHELL=rc 9term -s'
