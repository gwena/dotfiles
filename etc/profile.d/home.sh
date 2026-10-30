#!/bin/sh

export IT="${HOME}/IT"
export SCRIPTS="${IT}/Scripts"
export DOTS_PATH="${IT}/dotfiles"

p1="${SCRIPTS}/profile/profile.sh"
p2="${IT}/private/profile-private.sh"

[ -f "$p1" ] && . "$p1"
[ -f "$p2" ] && . "$p2"
