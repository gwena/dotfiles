import XMonad

main = xmonad def
    { modMask     = mod4Mask -- Super_L instead of Alt (i3wm and emacs)
    , borderWidth = 3
    }
