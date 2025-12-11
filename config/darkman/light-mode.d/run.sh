#!/usr/bin/env bash

notify-send --app-name="darkman" --urgency=low "Switching to light mode"

cp -v $XDG_CONFIG_HOME/sway/theme-colors_light $XDG_CONFIG_HOME/sway/theme-colors
# Sway needs to be reloaded when the colors switch
swaymsg reload

export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --highlight-line \
  --info=inline-right \
  --ansi \
  --layout=reverse \
  --border=none \
  --color=bg+:#b7c1e3 \
  --color=bg:#d0d5e3 \
  --color=border:#4094a3 \
  --color=fg:#3760bf \
  --color=gutter:#d0d5e3 \
  --color=header:#b15c00 \
  --color=hl+:#188092 \
  --color=hl:#188092 \
  --color=info:#8990b3 \
  --color=marker:#d20065 \
  --color=pointer:#d20065 \
  --color=prompt:#188092 \
  --color=query:#3760bf:regular \
  --color=scrollbar:#4094a3 \
  --color=separator:#b15c00 \
  --color=spinner:#d20065 \
 "

gsettings set org.gnome.desktop.interface gtk-theme 'Tokyonight-Light'

dbus-send --session --dest=org.kde.GtkConfig --type=method_call /GtkConfig org.kde.GtkConfig.setGtkTheme "string:Default"

# Make sure this runs after sway reloads or the reload will overwrite the changed wallpaper
"$(xdg-user-dir BIN)"/random_wallpaper.sh "$(xdg-user-dir WALLPAPER)" light-
