-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

if wezterm.gui.get_appearance():find "Dark" then
  config.color_scheme = "tokyonight_moon"
else
  config.color_scheme = "tokyonight_day"
end

local act = wezterm.action
config.keys = {
  { key = 'UpArrow',   mods = 'SHIFT', action = act.ScrollByLine(-1) },
  { key = 'DownArrow', mods = 'SHIFT', action = act.ScrollByLine(1) },
  { key = 'PageUp',    mods = 'SHIFT', action = act.ScrollByPage(-0.75) },
  { key = 'PageDown',  mods = 'SHIFT', action = act.ScrollByPage(0.75) },
  {
    key = 'E',
    mods = 'CTRL|SHIFT',
    action = act.PromptInputLine {
      description = 'Enter new name for tab',
      action = wezterm.action_callback(function(window, _, line)
        -- line will be `nil` if they hit escape without entering anything
        -- An empty string if they just hit enter
        -- Or the actual line of text they wrote
        if line then
          window:active_tab():set_title(line)
        end
      end),
    },
  },
}

config.font = wezterm.font 'JetBrains Mono'
config.font_size = 20.0
-- and finally, return the configuration to wezterm
return config
