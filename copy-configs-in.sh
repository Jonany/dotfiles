#! /usr/bin/bash

echo "Copying ~/.bash_aliases"
cp ~/.bash_aliases .

echo "Copying ~/.bash_profile"
cp ~/.bash_profile .

echo "Copying ~/.bashrc"
cp ~/.bashrc .

echo "Copying $XDG_CONFIG_HOME/darkman"
cp -r $XDG_CONFIG_HOME/darkman config/
rm config/darkman/run-log

echo "Copying darkman $XDG_DATA_HOME/dark-mode.d"
cp -r $XDG_DATA_HOME/dark-mode.d config/darkman/

echo "Copying darkman $XDG_DATA_HOME/light-mode.d"
cp -r $XDG_DATA_HOME/light-mode.d config/darkman/

echo "Copying $XDG_CONFIG_HOME/ftpserver"
cp -r $XDG_CONFIG_HOME/ftpserver config/

echo "Copying $XDG_CONFIG_HOME/lsd"
cp -r $XDG_CONFIG_HOME/lsd config/

echo "Copying $XDG_CONFIG_HOME/minidlna"
cp -r $XDG_CONFIG_HOME/minidlna config/

echo "Copying $XDG_CONFIG_HOME/mpv"
cp -r $XDG_CONFIG_HOME/mpv config/

echo "Copying $XDG_CONFIG_HOME/navidrome"
cp -r $XDG_CONFIG_HOME/navidrome config/
cp $XDG_CONFIG_HOME/systemd/user/navidrome.service config/navidrome/

echo "Copying $XDG_CONFIG_HOME/nvim"
cp -r $XDG_CONFIG_HOME/nvim config/
rm config/nvim/lazy-lock.json

echo "Copying $XDG_BIN_DIR/random_wallpaper.sh"
cp $XDG_BIN_DIR/random_wallpaper.sh bin/

echo "Copying $XDG_CONFIG_HOME/sway"
cp -r $XDG_CONFIG_HOME/sway config/
rm config/sway/theme-colors

echo "Copying $XDG_CONFIG_HOME/starship.toml"
cp -r $XDG_CONFIG_HOME/starship.toml config/

echo "Copying $XDG_CONFIG_HOME/wezterm"
cp -r $XDG_CONFIG_HOME/wezterm config/

echo "Copying $XDG_CONFIG_HOME/waybar"
cp -r $XDG_CONFIG_HOME/waybar config/

