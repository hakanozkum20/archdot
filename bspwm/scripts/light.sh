#! /bin/sh

if [[ $(xrandr -q | grep 'DP-0 connected') ]]	; then
    if [[ $(xrandr -q | grep 'HDMI-1-2 connected') ]]	; then
      xrandr --output DP-0 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output DP-1 --off --output eDP-1-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1-1 --off --output HDMI-1-1 --off --output HDMI-1-2 --mode 1920x1080 --pos 3840x0 --rotate normal

  bspc monitor DP-0 -d 1 2 3 4 5 6 7 8 9 10
  bspc monitor eDP-1-1 -d 1 2 3 4 5 6 7 8 9 10
    else
        xrandr --output DP-0 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output DP-1 --off --output eDP-1-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1-1 --off --output HDMI-1-1 --off --output HDMI-1-2 --off
  bspc monitor DP-0 -d 1 2 3 4 5 6 7 8 9 10
  bspc monitor eDP-1-1 -d 1 2 3 4 5 6 7 8 9 10
    fi
else
bspc monitor eDP-1-1 1 2 3 4 5 6 7 8 9 10
xrandr --auto
fi


#autostart
pgrep -x sxhkd > /dev/null || sxhkd &
pkill picom
picom &
feh --bg-fill --randomize ~/Pictures/backgrounds/light/*
~/.config/polybar/launch.sh 
nm-applet &
blueman-applet &



#monitor
bspc monitor -d 1 2 3 4 5 6 7 8 9 10

#window information
bspc config border_width 0 
bspc config window_gap 9
bspc config pointer_follows_monitor true
bspc config focus_follows_pointer true

bspc rule -a xed state=floating

