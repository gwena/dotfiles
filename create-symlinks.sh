#!/bin/bash
echo "Create Symbolic links for dotfiles/config files"

# ----- In HOME folder, adapt and move to .config when possible
cd ${HOME}
ln -sfv ${DOTS_PATH}/.zshrc .zshrc
ln -sfv ${DOTS_PATH}/.sharedrc .sharedrc
ln -sfv ${DOTS_PATH}/.vimrc .vimrc
ln -sfv ${DOTS_PATH}/.profile .profile
ln -sfv ${DOTS_PATH}/.xprofile .xprofile
ln -sfv ${DOTS_PATH}/.hidden .hidden # Nautilus but also PCManFM
ln -sfv ${DOTS_PATH}/.Xresources .Xresources
ln -sfv ${DOTS_PATH}/.urxvt .urxvt

rm -rf .screenlayout
ln -sfv ${DOTS_PATH}/.screenlayout .screenlayout
#
# Not in dotfiles
ln -sfnv ${SCRIPTS}/.ssh .ssh

# ----- In .config folder
cd ${HOME}/.config

ln -sfnv ${SCRIPTS}/doom doom

rm -rf git
ln -sfv ${DOTS_PATH}/git git

rm -rf alacritty
ln -sfv ${DOTS_PATH}/alacritty alacritty

rm -rf ranger
ln -sfnv ${DOTS_PATH}/ranger ranger

rm -rf rclone
ln -sfnv ${SCRIPTS}/rclone rclone

ln -sfv ${DOTS_PATH}/redshift.conf redshift.conf

rm -rf kitty
ln -sfnv ${DOTS_PATH}/kitty kitty

rm -rf i3 
ln -sfv ${DOTS_PATH}/i3 i3
rm -rf pcmanfm
ln -sfv ${DOTS_PATH}/pcmanfm pcmanfm
rm -rf i3status-rust
ln -sfv ${DOTS_PATH}/i3status-rust i3status-rust
rm -rf rofi
ln -sfv ${DOTS_PATH}/rofi rofi
rm -rf dunst
ln -sfv ${DOTS_PATH}/dunst dunst
rm -rf hypr
ln -sfv ${DOTS_PATH}/hypr hypr
rm -rf waybar
ln -sfv ${DOTS_PATH}/waybar waybar
rm -rf wofi 
ln -sfv ${DOTS_PATH}/wofi wofi
rm -rf swappy 
ln -sfv ${DOTS_PATH}/swappy swappy
rm -rf spotify-tui
ln -sfv ${SCRIPTS}/linux-only-perso/spotify-tui spotify-tui
rm -rf idasen-controller
ln -sfv ${SCRIPTS}/linux-only-perso/idasen-controller idasen-controller

# ----- Special cases, where not the whole folder is symlinked
mkdir -p ${HOME}/.lein
cd ${HOME}/.lein
ln -sfv ${DOTS_PATH}/.lein/profiles.clj profiles.clj

mkdir -p ${HOME}/.config/clojure
cd ${HOME}/.config/clojure
ln -sfv ${DOTS_PATH}/clojure/deps.edn deps.edn
ln -sfv ${DOTS_PATH}/clojure/tools tools

