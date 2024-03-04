#!/bin/sh
echo "Create Symbolic links for dotfiles/config files"

cd $HOME
ln -sfv $DOTS_PATH/.zshrc .zshrc
# might be better to regenerate each time
# with list of choices
# ln -sfv $DOTS_PATH/.p10k.zsh .p10k.zsh
ln -sfv $DOTS_PATH/.sharedrc .sharedrc
ln -sfv $DOTS_PATH/.alacritty.toml .alacritty.toml
# not needed anymore and obsolete
# ln -sfv $DOTS_PATH/.bashrc .bashrc
ln -sfv $DOTS_PATH/.vimrc .vimrc
ln -sfv $DOTS_PATH/.ideavimrc .ideavimrc
ln -sfv $DOTS_PATH/.gitconfig .gitconfig
ln -sfv $DOTS_PATH/.gitignore_global .gitignore_global
ln -sfv $DOTS_PATH/.ackrc .ackrc
ln -sfv $DOTS_PATH/.agignore .agignore
# ln -sfv $DOTS_PATH/.inputrc .inputrc # was only for sbt (bug)
# ln -sfv $DOTS_PATH/.haskeline .haskeline
# ln -sfv $DOTS_PATH/.gemrc .gemrc
# ln -sfv $DOTS_PATH/.pryrc .pryrc
# ln -sfv $DOTS_PATH/.joker .joker
# ln -sfv $DOTS_PATH/.tmux.conf .tmux.conf
# ln -sfv $DOTS_PATH/.spacemacs .spacemacs

# Not in dotfiles
ln -sfnv ${SCRIPTS}.ssh .ssh
ln -sfnv ${SCRIPTS}doom.d .doom.d

cd ~/.config

rm -rf ranger
ln -sfnv $DOTS_PATH/ranger ranger

rm -rf rclone
ln -sfnv $SCRIPTS/rclone rclone

ln -sfv $DOTS_PATH/redshift.conf redshift.conf

rm -rf kitty
ln -sfnv $DOTS_PATH/kitty kitty

mkdir -p $HOME/.lein
cd $HOME/.lein
ln -sfv $DOTS_PATH/.lein/profiles.clj profiles.clj

mkdir -p $HOME/.clojure
cd $HOME/.clojure
ln -sfv $DOTS_PATH/.clojure/deps.edn deps.edn

# mkdir -p $HOME/.jokerd
# cd $HOME/.jokerd
# ln -sfv $DOTS_PATH/joker-linter.cljc linter.cljc

# Haskell - Not used at the moment
# mkdir -p $HOME/.ghc
# chmod go-w $HOME/.ghc
# cd $HOME/.ghc
# ln -sfv $DOTS_PATH/ghci.conf ghci.conf
# mkdir -p $HOME/.stack
# cd $HOME/.stack
# ln -sfv $DOTS_PATH/.stack/config.yaml config.yaml

# Scala/SBT - Not used at the moment, and next will be 1.x anyway
# sbtConfigFolder=.sbt/0.13/
# sbtPlugins=$sbtConfigFolder/plugins
# mkdir -p $HOME/$sbtPlugins
# cd $HOME/$sbtPlugins
# ln -sfv $DOTS_PATH/$sbtPlugins/plugins.sbt plugins.sbt
# cd $HOME/.sbt
# ln -sfv $DOTS_PATH/linux-only-perso/sbt-credentials-nexus .credentials
# Disable for now
# cd $HOME/$sbtConfigFolder
# ln -sfv $DOTS_PATH/$sbtConfigFolder/global.sbt global.sbt

cd $HOME
case "$(uname -s)" in
    Linux)
        echo '### Linux only symlinks'

        ln -sfv $DOTS_PATH/linux-only/.profile .profile
        ln -sfv $DOTS_PATH/linux-only/.xprofile .xprofile
        ln -sfv $DOTS_PATH/linux-only/.hidden .hidden # Nautilus but also PCManFM
        ln -sfv $DOTS_PATH/linux-only/.gvimrc .gvimrc
        ln -sfv $DOTS_PATH/linux-only/.Xresources .Xresources
        ln -sfnv $DOTS_PATH/linux-only/.urxvt .urxvt
        ln -sfnv $DOTS_PATH/linux-only/.screenlayout .screenlayout

        mkdir -p $HOME/.i3
        cd $HOME/.i3
        ln -sfv $DOTS_PATH/linux-only/i3-config config

        cd $HOME/.config
        rm -rf pcmanfm
        ln -sfv $DOTS_PATH/linux-only/pcmanfm pcmanfm
        rm -rf i3status-rust
	      ln -sfv $DOTS_PATH/linux-only/i3status-rust i3status-rust
        rm -rf rofi
	      ln -sfv $DOTS_PATH/linux-only/rofi rofi
        rm -rf spotify-tui
        ln -sfv $SCRIPTS/linux-only-perso/spotify-tui spotify-tui
        rm -rf idasen-controller
        ln -sfv $SCRIPTS/linux-only-perso/idasen-controller idasen-controller
        ;;

    Darwin)
        echo '### MacOS only symlinks'
        echo 'Will not do anything special'
        ;;

    *)
        echo '### Other OS - WEIRD!!!'
        ;;
esac
