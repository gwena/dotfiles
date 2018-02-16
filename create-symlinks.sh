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

# Not in dotfiles
ln -sfv $HOME/Documents/Scripts/.ssh .ssh

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

cd ~/
case "$(uname -s)" in
    Linux)
        echo '### Linux only symlinks'
        ln -sfv $script/linux-only/.imwheelrc .imwheelrc
        ln -sfv $script/linux-only/.hidden .hidden
        ln -sfv $script/linux-only/.gvimrc .gvimrc

        # @TODO - check folders below

        cd ~/.config/terminator
        ln -sfv $script/linux-only/config-Terminator config

        cd ~/.config/gtk-3.0
        ln -sfv $script/linux-only-perso/bookmarks-gtk3-nautilus bookmarks

        ;;

    Darwin)
        echo '### MacOSX only symlinks'
        echo 'Will not do anything special'
        ;;

    *)
        echo '### Other OS - WEIRD!!!' 
        ;;
esac
