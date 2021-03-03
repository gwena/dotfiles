export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/nano
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# fix "xdg-open fork-bomb" export your preferred browser from here
export BROWSER=/usr/bin/firefox

# Default behavior of xcape: map Control_L to Esc is released
xcape

# Only for i3
# Map Super to "non" existing key, will be used by i3wm to map Super alone (simpler, same as Gnome)
if [ $XDG_CURRENT_DESKTOP = "i3" ]; then
    xcape -t 150 -e 'Super_L=Super_L|Escape'
fi

source $HOME/Documents/Scripts/dotfiles/linux-only-perso/profile-private.sh

# Disabled for now - to check later
#
# Turn off system beep in console:
# xset b off
# xset b 0 0 0

# No suspend/screen blanker
# xset dpms 0 0 0

# Keep them even even if not running i3
# export I3BLOCKS_SCRIPTS=$HOME/Documents/Scripts/i3blocks-scripts
# export I3_SCRIPTS=$HOME/Documents/Scripts/i3-scripts
