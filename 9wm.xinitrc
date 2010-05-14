[ -f $HOME/common.xinitrc ] && . $HOME/common.xinitrc

if [ -f $HOME/img/desktop ]; then
	xsetbg -border black -center $HOME/img/desktop
else
	xsetroot -solid black
fi

9menu -geometry +0+0 -iconic -teleport -popdown "mutt:xterm -e mutt" "chrome:google-chrome" exit &
exec 9wm -virtuals 9 -term xterm
