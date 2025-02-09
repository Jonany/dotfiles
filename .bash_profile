if [[ -f ~/.bashrc ]]; then
  source ~/.bashrc
fi

export QT_QPA_PLATFORMTHEME=qt6ct

if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec sway
fi

export EDITOR=nvim
export XDG_SCREENSHOTS_DIR=$HOME/media/screenshots
export XDG_PICTURES_DIR=$HOME/media/pictures
#export XDG_DATA_DIRS=$XDG_DATA_DIRS:$XDG_CONFIG_HOME/darkman/dark-mode.d:$XDG_CONFIG_HOME/darkman/light-mode.d
export BUN_INSTALL="$HOME/.bun"
export FNM_PATH="$HOME/.local/share/fnm"

export PATH=$BUN_INSTALL/bin:$PATH
export PATH=$PATH:$HOME/bin
export PATH=$PATH:/usr/sbin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/bin/zig
export PATH=$PATH:$HOME/bin/helix
export PATH=$PATH:/opt/nvim-linux64/bin
export PATH=$PATH:$HOME/.spicetify

# Run Cargo's env setup
source "$HOME/.cargo/env"

if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi
