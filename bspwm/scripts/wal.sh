#!/bin/sh

if [ "$(cat ~/.wallpaper_mode)" = "light" ]; then
  feh --bg-fill --randomize ~/Pictures/backgrounds/light/*
else
  feh --bg-fill --randomize ~/Pictures/backgrounds/dark/*
fi
