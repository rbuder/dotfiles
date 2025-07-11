#!/usr/bin/env bash

# check hyprpaper is running
pidof hyprpaper > /dev/null || hyprpaper &

WALLPAPER_DIR="$HOME/Pictures/wallpaper/"
CURRENT_WALL=$(hyprctl hyprpaper listloaded)

WALLPAPER=$(find "$WALLPAPER_DIR" -type f ! -name "$(basename "CURRENT_WALL")" | shuf -n 1)

hyprctl hyprpaper reload , "$WALLPAPER"
