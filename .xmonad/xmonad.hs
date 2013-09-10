import XMonad
import XMonad.Actions.CycleRecentWS
import XMonad.Config.Gnome
import XMonad.Util.EZConfig(additionalKeys)

myModMask = mod4Mask

main = xmonad gnomeConfig
    { modMask = myModMask
	, terminal = "xterm"
	, focusFollowsMouse = True
	} `additionalKeys`
	[ ((myModMask, xK_Tab), cycleRecentWS [xK_Alt_L] xK_Tab xK_grave)
	]
