# Will be sourced from .xprofile

export GDK_SCALE=1 # 2 will too big for Thunar
export GDK_DPI_SCALE=1
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_QPA_PLATFORMTHEME="qt5ct"
export EDITOR=/usr/bin/nano
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
# fix "xdg-open fork-bomb" export your preferred browser from here
export BROWSER=/usr/bin/firefox

# Default behavior of xcape: map Control_L to Esc if released
xcape

# Only for i3
# Map Super to "non" existing key, will be used by i3wm to map Super alone (simpler, same as Gnome)
if [ $XDG_CURRENT_DESKTOP = "i3" ]; then
    xcape -t 150 -e 'Super_L=Super_L|Escape'
fi

export ORG="$HOME/Documents/Self/NotesOrgMode"
export SCRIPTS="$HOME/Documents/Scripts/"
export PATH="$PATH:$SCRIPTS"
export DOTS_PATH="$SCRIPTS/dotfiles"

source "$SCRIPTS/linux-only-perso/profile-private.sh"
source "$HOME/.config/broot/launcher/bash/br"

# Disabled for now - to check later
#
# Turn off system beep in console:
# xset b off
# xset b 0 0 0

