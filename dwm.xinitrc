[ -f $HOME/common.xinitrc ] && . $HOME/common.xinitrc

if [ -f $HOME/img/desktop ]; then
	xsetbg -border black -center $HOME/img/desktop
else
	xsetroot -solid black
fi

# refresh dmenu cache
dmenu_path 2&> /dev/null

while true; 
do 
	DATE=`date +"%a %b %d %Y %R"`
	xsetroot -name "$DATE"
	sleep 60
done &

exec dwm
