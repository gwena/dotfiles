#!/bin/sh
echo "Create Symbolic links for dotfiles/config files"
script="$HOME/Documents/Scripts/dotfiles"

cd ~/
ln -sfv $script/.zshrc .zshrc
ln -sfv $script/.p10k.zsh .p10k.zsh
ln -sfv $script/.bashrc .bashrc
ln -sfv $script/.sharedrc .sharedrc
# ln -sfv $script/.spacemacs .spacemacs
ln -sfv $script/.vimrc .vimrc
ln -sfv $script/.alacritty.yml .alacritty.yml
ln -sfv $script/.ideavimrc .ideavimrc
# ln -sfv $script/.tmux.conf .tmux.conf
ln -sfv $script/.gitconfig .gitconfig
ln -sfv $script/.gitignore_global .gitignore_global
ln -sfv $script/.ackrc .ackrc
ln -sfv $script/.agignore .agignore
ln -sfv $script/.inputrc .inputrc
ln -sfv $script/.haskeline .haskeline
ln -sfv $script/.gemrc .gemrc
ln -sfv $script/.pryrc .pryrc
# ln -sfv $script/.joker .joker

ln -sfnv $HOME/Documents/Scripts/.ssh .ssh # Not in dotfiles
ln -sfnv $HOME/Documents/Scripts/doom.d .doom.d # Own Git Repo

cd ~/.config

ln -sfv $script/redshift.conf redshift.conf
# Use Manjaro's Config
# rm -rf ranger
# ln -sfnv $DOTS_PATH/ranger ranger

mkdir -p $HOME/.lein
cd $HOME/.lein
ln -sfv $script/.lein/profiles.clj profiles.clj

mkdir -p $HOME/.clojure
cd $HOME/.clojure
ln -sfv $script/.clojure/deps.edn deps.edn

# mkdir -p $HOME/.jokerd
# cd $HOME/.jokerd
# ln -sfv $script/joker-linter.cljc linter.cljc

# Haskell - Not used at the moment
# mkdir -p $HOME/.ghc
# chmod go-w $HOME/.ghc
# cd $HOME/.ghc
# ln -sfv $script/ghci.conf ghci.conf
# mkdir -p $HOME/.stack
# cd $HOME/.stack
# ln -sfv $script/.stack/config.yaml config.yaml

# Scala/SBT - Not used at the moment, and next will be 1.x anyway
# sbtConfigFolder=.sbt/0.13/
# sbtPlugins=$sbtConfigFolder/plugins
# mkdir -p $HOME/$sbtPlugins
# cd $HOME/$sbtPlugins
# ln -sfv $script/$sbtPlugins/plugins.sbt plugins.sbt
# cd $HOME/.sbt
# ln -sfv $script/linux-only-perso/sbt-credentials-nexus .credentials
# Disable for now
# cd $HOME/$sbtConfigFolder
# ln -sfv $script/$sbtConfigFolder/global.sbt global.sbt

cd $HOME
case "$(uname -s)" in
    Linux)
        echo '### Linux only symlinks'

        # ln -sfv $script/linux-only/.imwheelrc .imwheelrc
        ln -sfv $script/linux-only/.hidden .hidden
        ln -sfv $script/linux-only/.gvimrc .gvimrc
        ln -sfv $script/linux-only/.profile .profile
        ln -sfv $script/linux-only/.Xresources .Xresources
        ln -sfnv $script/linux-only/.urxvt .urxvt
        ln -sfnv $script/linux-only/.screenlayout .screenlayout
        ln -sfnv $script/linux-only-perso/.xsessionrc .xsessionrc

        # cd $HOME/.config
        # ln -sfnv $script/linux-only/config-terminator terminator

        mkdir -p $HOME/.config/gtk-3.0
        cd $HOME/.config/gtk-3.0
        ln -sfv $script/linux-only-perso/bookmarks-gtk3-nautilus bookmarks

        mkdir -p $HOME/.i3
        cd $HOME/.i3
        ln -sfv $script/linux-only/i3-config config

        # cd $HOME
        # ln -sfv $script/linux-only/i3blocks.conf .i3blocks.conf

        cd $HOME/.config
        ln -sfv $script/linux-only-perso/spotify-tui spotify-tui

        ;;

    Darwin)
        echo '### MacOSX only symlinks'
        echo 'Will not do anything special'
        ;;

    *)
        echo '### Other OS - WEIRD!!!'
        ;;
esac
