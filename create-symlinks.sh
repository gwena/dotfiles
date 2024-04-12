#!/bin/bash
echo "Create Symbolic links for dotfiles/config files. Should be idempotent"

# Once-off with sudo (commented after for simplicity)
# sudo ln -sfnv ${DOTS_PATH}/etc/profile.d/home.sh /etc/profile.d/home.sh

# ----- In HOME folder, adapt and move to .config when possible
cd ${HOME}
ln -sfnv ${DOTS_PATH}/.zshrc .zshrc
ln -sfnv ${DOTS_PATH}/.sharedrc .sharedrc
ln -sfnv ${DOTS_PATH}/.vimrc .vimrc
ln -sfnv ${DOTS_PATH}/.hidden .hidden # Nautilus but also PCManFM
ln -sfnv ${DOTS_PATH}/.Xresources .Xresources
ln -sfnv ${DOTS_PATH}/.urxvt .urxvt
ln -sfnv ${DOTS_PATH}/.screenlayout .screenlayout
ln -sfnv ${SCRIPTS}/.ssh .ssh

# ----- In .config folder
cd ${HOME}/.config
ln -sfnv ${DOTS_PATH}/git git
ln -sfnv ${DOTS_PATH}/alacritty alacritty
ln -sfnv ${DOTS_PATH}/ranger ranger
ln -sfnv ${DOTS_PATH}/redshift.conf redshift.conf
ln -sfnv ${DOTS_PATH}/kitty kitty
ln -sfnv ${DOTS_PATH}/i3 i3
ln -sfnv ${DOTS_PATH}/pcmanfm pcmanfm
ln -sfnv ${DOTS_PATH}/i3status-rust i3status-rust
ln -sfnv ${DOTS_PATH}/rofi rofi
ln -sfnv ${DOTS_PATH}/dunst dunst
ln -sfnv ${DOTS_PATH}/hypr hypr
ln -sfnv ${DOTS_PATH}/waybar waybar
ln -sfnv ${DOTS_PATH}/wofi wofi
ln -sfnv ${DOTS_PATH}/swappy swappy
ln -sfnv ${SCRIPTS}/doom doom
ln -sfnv ${SCRIPTS}/rclone rclone
ln -sfnv ${SCRIPTS}/linux-only-perso/spotify-tui spotify-tui
ln -sfnv ${SCRIPTS}/linux-only-perso/idasen-controller idasen-controller

# ----- Special cases where not the whole folder is symlinked
mkdir -p ${HOME}/.lein
cd ${HOME}/.lein
ln -sfnv ${DOTS_PATH}/.lein/profiles.clj profiles.clj

mkdir -p ${HOME}/.config/clojure
cd ${HOME}/.config/clojure
ln -sfnv ${DOTS_PATH}/clojure/deps.edn deps.edn
ln -sfnv ${DOTS_PATH}/clojure/tools tools

