#!/bin/sh
echo "Create Symbolic links for dotfiles/config files"
script="$HOME/Documents/Scripts/dotfiles"

cd ~/
ln -sfv $script/.zshrc .zshrc
ln -sfv $script/.bashrc .bashrc
ln -sfv $script/.sharedrc .sharedrc
ln -sfv $script/.profile .profile
ln -sfv $script/.spacemacs .spacemacs
ln -sfv $script/.vimrc .vimrc
ln -sfv $script/.ideavimrc .ideavimrc
ln -sfv $script/.tmux.conf .tmux.conf
ln -sfv $script/.gitconfig .gitconfig
ln -sfv $script/.ackrc .ackrc
ln -sfv $script/.agignore .agignore
ln -sfv $script/.inputrc .inputrc
ln -sfv $script/.haskeline .haskeline
ln -sfv $script/.gemrc .gemrc
ln -sfv $script/.pryrc .pryrc

# @TODO - Should only do it on Linux machine
ln -sfv $script/linux-only/.imwheelrc .imwheelrc
ln -sfv $script/linux-only/.hidden .hidden
# @TODO - check folder
cd ~/.config/terminator
ln -sfn $script/linux-only/config-Terminator config

cd ~/.config/gtk-3.0
ln -sfn $script/linux-only-perso/bookmarks-gtk3-nautilus bookmarks

# @TODO - Check if folder exists - else create first
chmod go-w /home/gwena/.ghc 
cd ~/.ghc
ln -sfv $script/ghci.conf ghci.conf

# @TODO - Check if folder exists - else create first
cd ~/.lein
ln -sfv $script/.lein/profiles.clj profiles.clj

# @TODO - same above
cd ~/.stack
ln -sfv $script/.stack/config.yaml config.yaml

# @TODO - Few more to be done - chec backup dotfiles, mostly Linux ones
#         Could also add as comment the Macos ones
