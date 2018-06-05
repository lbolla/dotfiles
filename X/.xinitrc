setxkbmap -option ctrl:nocaps # or 'swapcaps'
xbindkeys
xrdb -load .Xresources
autocutsel &
xscreensaver -no-splash -no-capture-stderr -log /tmp/xscreensaver.log &
exec awesome
