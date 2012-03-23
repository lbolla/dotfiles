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

# Muhanken/Henkan -> Windows key
# xmodmap -e "keycode 102 = Super_L"
xmodmap -e "add mod4 = Muhenkan_Mode"
xmodmap -e "add mod4 = Henkan_Mode"

# mouse selection
# autocutsel -fork &
# autocutsel -selection PRIMARY -fork &
