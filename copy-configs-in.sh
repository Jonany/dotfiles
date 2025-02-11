#! /usr/bin/bash

echo "Copying ~/.bash_aliases"
cp ~/.bash_aliases .

echo "Copying ~/.bash_profile"
cp ~/.bash_profile .

echo "Copying ~/.bashrc"
cp ~/.bashrc .

echo "Copying ~/.config/wezterm"
cp -r ~/.config/wezterm config/

echo "Copying ~/.config/ftpserver"
cp -r ~/.config/ftpserver config/

echo "Copying ~/.config/gerbera"
cp -r ~/.config/gerbera config/

echo "Copying ~/.config/lsd"
cp -r ~/.config/lsd config/

echo "Copying ~/.config/mpv"
cp -r ~/.config/mpv config/

echo "Copying ~/.config/nvim"
cp -r ~/.config/nvim config/
rm config/nvim/lazy-lock.json

echo "Copying ~/.config/sway"
cp -r ~/.config/sway config/

echo "Copying ~/.config/wezterm"
cp -r ~/.config/wezterm config/

echo "Copying ~/.config/starship.toml"
cp -r ~/.config/starship.toml config/
