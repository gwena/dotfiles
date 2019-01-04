#!/bin/sh
echo "Create Symbolic links for dotfiles/config files"
script="$HOME/Documents/Scripts/dotfiles"

cd ~/
ln -sfv $script/.zshrc .zshrc
ln -sfv $script/.bashrc .bashrc
ln -sfv $script/.sharedrc .sharedrc
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

ln -sfv $HOME/Documents/Scripts/.ssh .ssh # Not in dotfiles

mkdir -p $HOME/.config/ranger
cd $HOME/.config/ranger
ln -sfv $script/ranger.conf rc.conf

mkdir -p $HOME/.config/redshift
cd $HOME/.config/redshift
ln -sfv $script/redshift.conf redshift.conf

mkdir -p $HOME/.lein
cd $HOME/.lein
ln -sfv $script/.lein/profiles.clj profiles.clj

mkdir -p $HOME/.ghc
chmod go-w $HOME/.ghc
cd $HOME/.ghc
ln -sfv $script/ghci.conf ghci.conf

mkdir -p $HOME/.stack
cd $HOME/.stack
ln -sfv $script/.stack/config.yaml config.yaml

sbtConfigFolder=.sbt/0.13/
sbtPlugins=$sbtConfigFolder/plugins
mkdir -p $HOME/$sbtPlugins
cd $HOME/$sbtPlugins
ln -sfv $script/$sbtPlugins/plugins.sbt plugins.sbt
cd $HOME/.sbt
ln -sfv $script/linux-only-perso/sbt-credentials-nexus .credentials


# Disable for now
# cd $HOME/$sbtConfigFolder
# ln -sfv $script/$sbtConfigFolder/global.sbt global.sbt

cd $HOME
case "$(uname -s)" in
    Linux)
        echo '### Linux only symlinks'

        ln -sfv $script/linux-only/.imwheelrc .imwheelrc
        ln -sfv $script/linux-only/.hidden .hidden
        ln -sfv $script/linux-only/.gvimrc .gvimrc
        ln -sfv $script/linux-only/.profile .profile

        cd $HOME/.config
        ln -sfv $script/linux-only/config-terminator terminator

        mkdir -p $HOME/.config/gtk-3.0
        cd $HOME/.config/gtk-3.0
        ln -sfv $script/linux-only-perso/bookmarks-gtk3-nautilus bookmarks

        mkdir -p $HOME/.config/i3
        cd $HOME/.config/i3
        ln -sfv $script/linux-only/i3-config config
        cd $HOME
        ln -sfv $script/linux-only/i3blocks.conf .i3blocks.conf

        mkdir $HOME/.xmonad
        cd $HOME/.xmonad
        ln -sfv $script/linux-only/xmonad.hs xmonad.hs

        ;;

    Darwin)
        echo '### MacOSX only symlinks'
        echo 'Will not do anything special'
        ;;

    *)
        echo '### Other OS - WEIRD!!!' 
        ;;
esac
