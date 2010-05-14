setxkbmap us

eval `ssh-agent -s`
# ssh-add

if [ -f $HOME/.Xdefaults ]; then
	xrdb -merge $HOME/.Xdefaults
fi

if [ -f $HOME/img/desktop ]; then
	xsetbg -border black -center $HOME/img/desktop
else
	xsetroot -solid black
fi

xset fp+ /usr/share/fonts/Proggy
xset mouse 2/1 0
#xmodmap -e "pointer = 3 2 1"

while true; 
do 
	SPACER=" | "
	DATE=`date +"%a %b %d %Y %R"`
	#NEMAILS=`$HOME/bin/check_email.sh`
	#MEMUSAGE=`$HOME/bin/memusage.sh`

	#xsetroot -name "MemUsed: $MEMUSAGE% $SPACER EMails: #$NEMAILS $SPACER $DATE"
	xsetroot -name "$DATE"

	sleep 60
done &

exec dwm
#dwm &
#sleeper
