#!/bin/bash
set -x

#Define the path dir
wallpaper_p = "$HOME/Pictures/baskgrounds"
config_p = "$HOME/.config"


# Define functions for notifying user and updating symlinks
notify_user() {
	notify-send -h string:x-canonical-private-synchronous:sys-notify -u normal "Switching to $1 mode"
}


# Determine the current wallpaper mode by checking a configuration file
if [ "$(cat ~/.wallpaper_mode)" = "light" ]; then
  current_mode="light"
  next_mode="dark"
else
  current_mode="dark"
  next_mode="light"
fi


#if [[ -n $(xrandr -q | grep 'DP-0 connected') && -n $(xrandr -q | grep 'HDMI-1-2 connected') ]]	; then
#
#xrandr --output DP-0 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output DP-1 --off --output eDP-1-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1-1 --off --output HDMI-1-1 --off --output HDMI-1-2 --mode 1920x1080 --pos 3840x0 --rotate normal
#
#  bspc monitor DP-0 -d 1 2 3 4 5 6 7 8 9 10
#  bspc monitor eDP-1-1 -d 1 2 3 4 5 6 7 8 9 10
#
#
#elif if [[ $(xrandr -q | grep 'DP-0 connected') ]]; then
#
#xrandr --output DP-0 --primary --mode 1920x1080 --pos 1920x0 --rotate normal --output DP-1 --off --output eDP-1-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1-1 --off --output HDMI-1-1 --off --output HDMI-1-2 --off
#  bspc monitor DP-0 -d 1 2 3 4 5 6 7 8 9 10
#  bspc monitor eDP-1-1 -d 1 2 3 4 5 6 7 8 9 10
#
#else
#bspc monitor eDP-1-1 1 2 3 4 5 6 7 8 9 10
#xrandr --auto
#
#fi








path_param=$(echo $next_mode | sed 's/.*/\u&/')

notify_user "$next_mode"


cp "$HOME/.config/gtk-3.0/themes/${next_mode}.ini" "$HOME/.config/gtk-3.0/settings.ini"
cp "$HOME/.config/polybar/themes/${next_mode}.ini" "$HOME/.config/polybar/colors.ini"
###ecp "$HOME/.config/polybar/themes/${next_mode}.theme" "/usr/share/icons/candy-icons/index.theme"

cp "$HOME/.config/rofi/launchers/type-2/shared/${next_mode}.sh" "$HOME/.config/rofi/launchers/type-2/launcher.sh"
cp "$HOME/.config/rofi/launchers/type-2/shared/${next_mode}.rasi" "$HOME/.config/rofi/launchers/type-2/shared/colors.rasi"

cp "$HOME/.config/rofi/powermenu/type-2/shared/${next_mode}.sh" "$HOME/.config/rofi/powermenu/type-2/powermenu.sh"
cp "$HOME/.config/rofi/powermenu/type-2/shared/${next_mode}.rasi" "$HOME/.config/rofi/powermenu/type-2/shared/colors.rasi"

cp "$HOME/.config/rofi/launchers/type-1/shared/${next_mode}.sh" "$HOME/.config/rofi/launchers/type-1/launcher.sh"
cp "$HOME/.config/rofi/launchers/type-1/shared/${next_mode}.rasi" "$HOME/.config/rofi/launchers/type-1/shared/colors.rasi"

cp "$HOME/.config/alacritty/catppuccin/${next_mode}.yml" "$HOME/.config/alacritty/alacritty.yml"

cp "$HOME/.config/bspwm/scripts/${next_mode}.sh" "$HOME/.config/bspwm/bspwmrc"


echo "$next_mode" > ~/.wallpaper_mode
bspc wm -r
