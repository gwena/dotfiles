# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Mostly key mappings

# Configure Compose Key to be AltGr for the accents
setxkbmap -layout 'us(altgr-intl)'

# Map Ctrl to Enter (if use with another key)
# xmodmap -e "remove Control = Control_R"
# xmodmap -e "keycode 0x69 = Return"
# xmodmap -e "keycode 0x24 = Control_R"
# xmodmap -e "add Control = Control_R"
# xcape -t 10000 -e "Control_R=Return"

# Map Ctrl_R to Mod4 / Super
xmodmap -e 'remove Control = Control_R'
xmodmap -e 'add Mod4 = Control_R'

# Should do the same for the Caps Lock Key for symetry

# Remap Capslock to Esc
xmodmap -e "clear lock"
xmodmap -e "keysym Caps_Lock = Escape"

# Default behavior of xcape: map Control_L to Esc is released
xcape

# Only for i3
# Map Super to "non" existing key, will be used by i3wm to map Super alone (simpler, same as Gnome)
if [ $XDG_CURRENT_DESKTOP = "i3" ]; then
    xcape -t 150 -e 'Super_L=Super_L|Escape'
fi

# Keep them even even if not running i3
export I3BLOCKS_SCRIPTS=$HOME/Documents/Scripts/i3blocks-scripts
export I3_SCRIPTS=$HOME/Documents/Scripts/i3-scripts

export JDK_HOME=/usr/lib/jvm/java-11-openjdk-amd64

# Homebrew
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

sh $HOME/Documents/Scripts/dotfiles/linux-only-perso/profile-private.sh
