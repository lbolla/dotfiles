--  import XMonad
--  import XMonad.Actions.CycleRecentWS
--  import XMonad.Config.Gnome
--  import XMonad.Util.EZConfig(additionalKeys)

--  myModMask = mod4Mask

--  main = xmonad gnomeConfig
	--  { modMask = myModMask
	--  , terminal = "xterm"
	--  , focusFollowsMouse = True
	--  } `additionalKeys`
	--  [ ((myModMask, xK_Tab), cycleRecentWS [xK_Alt_L] xK_Tab xK_grave)
	--  ]
import XMonad
import XMonad.Config.Gnome

myManageHook = composeAll (
	[ manageHook gnomeConfig
	, className =? "Unity-2d-panel" --> doIgnore
	, className =? "Unity-2d-launcher" --> doFloat
	])

main = xmonad gnomeConfig { manageHook = myManageHook }
