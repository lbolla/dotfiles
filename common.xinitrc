setxkbmap us

eval `ssh-agent -s`
# ssh-add

if [ -f $HOME/.Xdefaults ]; then
	xrdb -merge $HOME/.Xdefaults
fi

xset fp+ /usr/share/fonts/Proggy
xset mouse 2/1 0
#xmodmap -e "pointer = 3 2 1"
