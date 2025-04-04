if [[ -f ~/.bashrc ]]; then
  source ~/.bashrc
fi

export QT_QPA_PLATFORMTHEME=qt6ct

if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec sway
fi

export EDITOR=nvim

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_SCREENSHOTS_DIR=$HOME/media/image/screenshots
export XDG_PICTURES_DIR=$HOME/media/image/pictures
export XDG_DATA_DIRS=$XDG_DATA_DIRS:$XDG_CONFIG_HOME/darkman/dark-mode.d
export XDG_DATA_DIRS=$XDG_DATA_DIRS:$XDG_CONFIG_HOME/darkman/light-mode.d
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

# Run Cargo's env setup
source "$HOME/.cargo/env"

if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi

# Created by `pipx` on 2025-02-17 16:43:06
export PATH="$PATH:/home/jonany/.local/bin"

# HSTR configuration - add this to ~/.bashrc
alias hh=hstr                    # hh to be alias for hstr
export HSTR_CONFIG=hicolor       # get more colors
shopt -s histappend              # append new history items to .bash_history
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
# ensure synchronization between bash memory and history file
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
function hstrnotiocsti {
    { READLINE_LINE="$( { </dev/tty hstr ${READLINE_LINE}; } 2>&1 1>&3 3>&- )"; } 3>&1;
    READLINE_POINT=${#READLINE_LINE}
}
# if this is interactive shell, then bind hstr to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind -x '"\C-r": "hstrnotiocsti"'; fi
export HSTR_TIOCSTI=n
