-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- For example, changing the color scheme:
config.color_scheme = 'OneDark (base16)'
config.font = wezterm.font 'JetBrains Mono'
config.font_size = 16.0

config.enable_tab_bar = false
config.window_decorations = 'RESIZE'

config.keys = {
  {
    key = 'Enter',
    mods = 'ALT',
    action = wezterm.action.DisableDefaultAssignment,
  },
-- Norwegian keys
  {
    key = '7',
    mods = 'ALT',
    action = wezterm.action.SendString "|",
  },
  {
    key = '8',
    mods = 'ALT',
    action = wezterm.action.SendString "[",
  },
  {
    key = '9',
    mods = 'ALT',
    action = wezterm.action.SendString "]",
  },
  {
    key = '(',
    mods = 'ALT|SHIFT',
    action = wezterm.action.SendString "{",
  },
  {
    key = ')',
    mods = 'ALT|SHIFT',
    action = wezterm.action.SendString "}",
  },
}

-- and finally, return the configuration to wezterm
return config
