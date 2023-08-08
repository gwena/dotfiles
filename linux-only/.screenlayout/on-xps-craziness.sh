#!/bin/sh
# Switch DP-2 and DP-3 based on standard/open, or standup
# DP-2 - standard/open - away right
# DP-3 - standup - bottom right (real left)
xrandr --output eDP-1 --off --output DP-1 --off --output DP-2 --mode 5120x2160 --rate 72 --pos 0x0 --rotate normal --output DP-3 --off --output DP-4 --off --output DP-1-0 --off --output DP-1-1 --off --output DP-1-2 --off --output DP-1-3 --off --output DP-1-4 --off --output DP-1-5 --off --output DP-1-6 --off --output DP-1-7 --off
