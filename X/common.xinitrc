setxkbmap us

eval `ssh-agent -s`
ssh-add

if [ -f $HOME/.Xdefaults ]; then
	xrdb -merge $HOME/.Xdefaults
fi
if [ -f $HOME/src/solarized/xresources-colors-solarized/Xresources ]; then
	xrdb -merge $HOME/src/solarized/xresources-colors-solarized/Xresources
fi

# fonts
xset fp+ /usr/share/fonts/

# # keyboard
# # Muhanken/Henkan -> Windows key
# xmodmap -e "keycode 102 = Super_L"
# xmodmap -e "add mod4 = Muhenkan_Mode"
# xmodmap -e "add mod4 = Henkan_Mode"

# # mouse
# xmodmap -e "pointer = 3 2 1"
# xset mouse 2/1 0
# autocutsel -fork &
# autocutsel -selection PRIMARY -fork &
