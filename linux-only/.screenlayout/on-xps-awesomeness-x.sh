#!/bin/sh
./on-xps-awesomeness.sh
sed -i "s/^Xft.dpi.*/Xft.dpi: 112/g" ~/.Xresources
xrdb ~/.Xresources
i3-msg restart

