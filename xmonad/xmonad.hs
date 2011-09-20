import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import Control.Monad (when)
import System.Environment (getArgs)
import System.IO

main=do
  args <- getArgs
  xmproc <- spawnPipe "/usr/bin/xmobar -x 3 /home/kevin/.xmobarrc"
  xmonad $ defaultConfig
    { terminal   ="urxvt"
    , borderWidth=2
    , focusedBorderColor ="blue"
    , manageHook = manageDocks <+> manageHook defaultConfig
    , layoutHook = avoidStruts $ layoutHook defaultConfig
    , logHook = dynamicLogWithPP $ xmobarPP
                    { ppOutput = hPutStrLn xmproc
                    , ppTitle = xmobarColor "blue" "" . shorten 50
                    }
    } `additionalKeys`
    [ ((mod1Mask .|. shiftMask, xK_z), spawn "/home/kevin/bin/kevin_locker.sh")
    ]
