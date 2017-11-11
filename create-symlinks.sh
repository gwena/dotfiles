#!/bin/sh
echo "Create Symbolic links for dotfiles/config files"
script="$HOME/Documents/Scripts/dotfiles"

cd ~/
ln -sfv $script/.zshrc .zshrc
ln -sfv $script/.bashrc .bashrc
ln -sfv $script/.sharedrc .sharedrc
ln -sfv $script/.spacemacs .spacemacs
ln -sfv $script/linux-only/.imwheelrc .imwheelrc

# Check if folder exist - else create first
chmod go-w /home/gwena/.ghc 
cd ~/.ghc
ln -sfv $script/ghci.conf ghci.conf

