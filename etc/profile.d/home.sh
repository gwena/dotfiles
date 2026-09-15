#!/bin/sh

export IT="${HOME}/IT"
export SCRIPTS="${IT}/Scripts"
export DOTS_PATH="${IT}/dotfiles"

test -f "${DOTS_PATH}/profile.sh" && source "${DOTS_PATH}/profile.sh"
test -f "${IT}/private/profile-private.sh" && source "${IT}/private/profile-private.sh"

