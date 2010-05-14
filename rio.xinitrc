[ -f $HOME/common.xinitrc ] && . $HOME/common.xinitrc

exec rio -term xterm -virtuals 9
