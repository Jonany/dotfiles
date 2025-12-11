if [[ -f ~/.bashrc ]]; then
  source ~/.bashrc
fi

export QT_QPA_PLATFORMTHEME=qt6ct

if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec sway
fi

export EDITOR=nvim

export XDG_CONFIG_HOME="$HOME/.config"
# Sources XDG environment variables for stuff like Music, Downloads, Pictures, etc.
if [ -f "$XDG_CONFIG_HOME/user-dirs.dirs" ]; then
    set -a # Enable automatic exporting of all variables
    . "$XDG_CONFIG_HOME/user-dirs.dirs"
    set +a # Disable automatic exporting after sourcing
fi
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CURRENT_DESKTOP=sway # xdg-desktop-portal
export XDG_SESSION_DESKTOP=sway # systemd
export XDG_SESSION_TYPE=wayland # xdg/systemd

export BUN_INSTALL="$HOME/.bun"
export FNM_PATH="$HOME/.local/share/fnm"
export WEZTERM_CONFIG_FILE=$XDG_CONFIG_HOME/wezterm/config.lua
export VIMRUNTIME=/usr/local/share/nvim/runtime

export PATH=$BUN_INSTALL/bin:$PATH
export PATH=$PATH:$HOME/bin
export PATH=$PATH:/usr/sbin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/bin/zig
export PATH=$PATH:$HOME/bin/helix
export PATH=$PATH:/opt/nvim-linux64/bin
export PATH=$PATH:$HOME/.spicetify

# Tell Vulkan to use the Intel GPU instead of trying to use VIRTGPU
export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/intel_icd.x86_64.json

# Run Cargo's env setup
source "$HOME/.cargo/env"

if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi

# Created by `pipx` on 2025-02-17 16:43:06
export PATH="$PATH:/home/jonany/.local/bin"


. "$HOME/.local/share/../bin/env"
