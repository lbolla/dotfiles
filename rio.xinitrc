setxkbmap us

if [ -f $HOME/.Xdefaults ]; then
	xrdb -merge $HOME/.Xdefaults
fi

xset fp+ /usr/share/fonts/Proggy
xset mouse 2/1 0
#xmodmap -e "pointer = 3 2 1"

exec rio -term xterm -virtuals 9
