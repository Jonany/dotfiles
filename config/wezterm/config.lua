-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

if wezterm.gui.get_appearance():find "Dark" then
  config.color_scheme = "tokyonight_moon"
else
  config.color_scheme = "tokyonight_day"
end

config.font = wezterm.font 'JetBrains Mono'
config.font_size = 18.0
-- and finally, return the configuration to wezterm
return config
