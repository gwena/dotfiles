#!/bin/sh
./on-xps-laptop.sh
sed -i "s/^Xft.dpi.*/Xft.dpi: 192/g" ~/.Xresources
xrdb ~/.Xresources
i3-msg restart

