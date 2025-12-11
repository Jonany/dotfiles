#!/usr/bin/env bash

notify-send --app-name="darkman" --urgency=low "Switching to dark mode"

cp $XDG_CONFIG_HOME/sway/theme-colors_dark $XDG_CONFIG_HOME/sway/theme-colors
# Sway needs to be reloaded when the colors switch
swaymsg reload

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --highlight-line \
  --info=inline-right \
  --ansi \
  --layout=reverse \
  --border=none \
  --color=bg+:#2d3f76 \
  --color=bg:#1e2030 \
  --color=border:#589ed7 \
  --color=fg:#c8d3f5 \
  --color=gutter:#1e2030 \
  --color=header:#ff966c \
  --color=hl+:#65bcff \
  --color=hl:#65bcff \
  --color=info:#545c7e \
  --color=marker:#ff007c \
  --color=pointer:#ff007c \
  --color=prompt:#65bcff \
  --color=query:#c8d3f5:regular \
  --color=scrollbar:#589ed7 \
  --color=separator:#ff966c \
  --color=spinner:#ff007c \
"

gsettings set org.gnome.desktop.interface gtk-theme 'Tokyonight-Dark'

dbus-send --session --dest=org.kde.GtkConfig --type=method_call /GtkConfig org.kde.GtkConfig.setGtkTheme "string:Breeze-dark-gtk"

# Make sure this runs after sway reloads or the reload will overwrite the changed wallpaper
"$(xdg-user-dir BIN)"/random_wallpaper.sh "$(xdg-user-dir WALLPAPER)" dark-
