#!/bin/sh
# DP-2 - standard/open - away right
# DP-3 - standup - bottom right (real left)
# xrandr --output eDP-1 --off --output DP-1 --off --output DP-2 --mode 5120x2160 --rate 72 --pos 0x0 --rotate normal --output DP-3 --off --output DP-4 --off --output DP-1-0 --off --output DP-1-1 --off --output DP-1-2 --off --output DP-1-3 --off --output DP-1-4 --off --output DP-1-5 --off --output DP-1-6 --off --output DP-1-7 --off

# Automatically check if which DP-1/2/3/4 the monitor is attached to, and use it, with off for all the other outputs
# Keep it as bash in case bb not yet installed
rest="--output eDP-1 --off --output DP-1-0 --off --output DP-1-1 --off --output DP-1-2 --off --output DP-1-3 --off --output DP-1-4 --off --output DP-1-5 --off --output DP-1-6 --off --output DP-1-7 --off"
#TODO to simplify, also should not use xrandr for Sway
dp=$(xrandr | grep " connected " | grep "^DP-" | cut -d " " -f 1)
dpn=$(echo $dp | cut -d "-" -f 2)

other=""
for i in {1..4}
do
  if [ $i != $dpn ]; then
    other+=" --output DP-${i} --off"
  fi
done

if [ $XDG_CURRENT_DESKTOP = "sway" ]; then
  wlr-randr --output $dp --mode 5120x2160 --pos 0,0 --transform normal --scale 1.2 --output eDP-1 --off
else
  xrandr --output $dp --mode 5120x2160 --rate 72 --pos 0x0 --rotate normal $other $rest
fi

