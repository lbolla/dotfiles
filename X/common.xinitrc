setxkbmap us

eval `ssh-agent -s`
ssh-add

if [ -f $HOME/.Xdefaults ]; then
	xrdb -merge $HOME/.Xdefaults
fi

# fonts
xset fp+ /usr/share/fonts/
#xset mouse 2/1 0
#xmodmap -e "pointer = 3 2 1"

# mouse selection
# autocutsel -fork &
# autocutsel -selection PRIMARY -fork &
