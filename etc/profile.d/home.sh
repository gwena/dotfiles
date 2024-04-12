#!/bin/sh

export SCRIPTS="${HOME}/Documents/Scripts"
export DOTS_PATH="${SCRIPTS}/dotfiles"

test -f "${DOTS_PATH}/profile.sh" && source "${DOTS_PATH}/profile.sh"
test -f "${SCRIPTS}/private/profile-private.sh" && source "${SCRIPTS}/private/profile-private.sh"

