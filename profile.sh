# /etc/profile.d/home.sh export $SCRIPTS and $DOTS_PATH
#                        source this file and profile-private 
export ORG="${HOME}/Documents/Self/NotesOrgMode"
export PATH="${PATH}:${SCRIPTS}"

# In theory, the $XDG folders should not have to be set if using default
# However, it is not always respected (e.g. Clojure, Nvidia)
# See Supported/Partial section of https://wiki.archlinux.org/title/XDG_Base_Directory
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"
export XDG_CACHE_HOME="${HOME}/.cache"

export GTK2_RC_FILES="${XDG_CONFIG_HOME}/gtkrc-2.0"
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=${XDG_CONFIG_HOME}/java -Djavafx.cachedir=${XDG_CACHE_HOME}/openjfx"
export LEIN_HOME="${XDG_CONFIG_HOME}/lein"
export GRADLE_USER_HOME="${XDG_CACHE_HOME}/gradle"
export CUDA_CACHE_PATH="${XDG_CACHE_HOME}/nv"
export _Z_DATA="${XDG_DATA_HOME}/z"
export CARGO_HOME="${XDG_DATA_HOME}/cargo"
export ANDROID_USER_HOME="{$XDG_DATA_HOME}/android"
export XCURSOR_PATH=/usr/share/icons:$XDG_DATA_HOME/icons

# Only partially supporded, do not use
# export GNUPGHOME="${XDG_CONFIG_HOME}/gnupg"
# export XINITRC="${XDG_CONFIG_HOME}/xinitrc"
# export XAUTHORITY="${XDG_CACHE_HOME}/Xauthority"

export GDK_SCALE=1 # 2 will too big for Thunar
export GDK_DPI_SCALE=1
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_QPA_PLATFORMTHEME="qt5ct"
export BROWSER=/usr/bin/firefox

source "${SCRIPTS}/fix-desktop-apps.sh"

# Only for X/i3
if [ $XDG_CURRENT_DESKTOP = "i3" ]; then
    # Default behavior of xcape: map Control_L to Esc if released
    xcape
    # Map Super to "non" existing key, will be used by i3wm to map Super alone (simpler, same as Gnome)
    xcape -t 150 -e 'Super_L=Super_L|Escape'
fi
