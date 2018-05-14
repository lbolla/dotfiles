setxkbmap -option ctrl:nocaps # or 'swapcaps'
xbindkeys
xrdb -load .Xresources
xscreensaver -no-splash -no-capture-stderr -log /tmp/xscreensaver.log &
exec awesome
