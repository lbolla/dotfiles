[ -f $HOME/common.xinitrc ] && . $HOME/common.xinitrc

xsetbg -border black -center $HOME/img/desktop &

exec fvwm

