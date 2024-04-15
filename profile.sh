# /etc/profile.d/home.sh export $SCRIPTS and $DOTS_PATH
#                        source this file and profile-private 
export ORG="${HOME}/Documents/Self/NotesOrgMode"
export PATH="${PATH}:${SCRIPTS}"

# In theory, if $XDG_CONFIG_HOME is either not set or empty, a default equal to $HOME/.config
# should be used, however not always respected (e.g. Clojure)
export XDG_CONFIG_HOME="${HOME}/.config"
export GTK2_RC_FILES="${XDG_CONFIG_HOME}/gtkrc-2.0"

export GDK_SCALE=1 # 2 will too big for Thunar
export GDK_DPI_SCALE=1
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_QPA_PLATFORMTHEME="qt5ct"
export BROWSER=/usr/bin/firefox

source "${HOME}/.config/broot/launcher/bash/br"

# Only for X/i3
if [ $XDG_CURRENT_DESKTOP = "i3" ]; then
    # Default behavior of xcape: map Control_L to Esc if released
    xcape
    # Map Super to "non" existing key, will be used by i3wm to map Super alone (simpler, same as Gnome)
    xcape -t 150 -e 'Super_L=Super_L|Escape'
fi
