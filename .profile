# Will be sourced from .xprofile

export GDK_SCALE=1 # 2 will too big for Thunar
export GDK_DPI_SCALE=1
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export BROWSER=/usr/bin/firefox # fix "xdg-open fork-bomb" export your preferred browser from here
# In theory, if $XDG_CONFIG_HOME is either not set or empty, a default equal to $HOME/.config
# should be used, however not always respected (e.g. Clojure)
export XDG_CONFIG_HOME="$HOME/.config"

# Default behavior of xcape: map Control_L to Esc if released
xcape

# Only for i3
if [ $XDG_CURRENT_DESKTOP = "i3" ]; then
    # Map Super to "non" existing key, will be used by i3wm to map Super alone (simpler, same as Gnome)
    xcape -t 150 -e 'Super_L=Super_L|Escape'
fi

export ORG="$HOME/Documents/Self/NotesOrgMode"
export SCRIPTS="$HOME/Documents/Scripts/"
export PATH="$PATH:$SCRIPTS"
export DOTS_PATH="$SCRIPTS/dotfiles"

source "$SCRIPTS/linux-only-perso/profile-private.sh"
source "$HOME/.config/broot/launcher/bash/br"

