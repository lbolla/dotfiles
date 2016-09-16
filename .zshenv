export GOPATH=$HOME/src/go
export GOROOT=/opt/go
export PLAN9=/home/lbolla/src/plan9port
export PYTHONHASHSEED=random

PATH=/opt/emacs/src:/opt/emacs/lib-src:/opt/cisco/anyconnect/bin:/opt/flow:/opt/node/bin:/opt/stackato:$PATH
PATH=$GOPATH/bin:$GOROOT/bin:$PATH
PATH=$HOME/bin:$HOME/.cache/rebar3/bin:$HOME/.cabal/bin:$HOME/src/cmd:$HOME/node_modules/.bin/:$HOME/.cache/rebar3/bin:$PATH:$PLAN9/bin:
export PATH

if [[ `tty` = /dev/tty* ]]; then
	# Terminal
	export TERM=linux
	# Nice terminal colors
	# http://askubuntu.com/questions/147462/how-can-i-change-the-tty-colors
	#  echo -en "\e]P0232323" # black
	echo -en "\e]P0000000" # black
	echo -en "\e]P82B2B2B" # darkgrey
	echo -en "\e]P1D75F5F" # darkred
	echo -en "\e]P9E33636" # red
	echo -en "\e]P287AF5F" # darkgreen
	echo -en "\e]PA98E34D" # green
	echo -en "\e]P3D7AF87" # brown
	echo -en "\e]PBFFD75F" # yellow
	echo -en "\e]P48787AF" # darkblue
	echo -en "\e]PC7373C9" # blue
	echo -en "\e]P5BD53A5" # darkmagenta
	echo -en "\e]PDD633B2" # magenta
	echo -en "\e]P65FAFAF" # darkcyan
	echo -en "\e]PE44C9C9" # cyan
	echo -en "\e]P7E5E5E5" # lightgrey
	echo -en "\e]PFFFFFFF" # white
	#clear # for background artifacting
else
	# Inside X
	export TERM=xterm-256color
fi
