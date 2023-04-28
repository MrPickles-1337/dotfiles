local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

config.font = wezterm.font 'Cascadia Code'
config.window_background_opacity = 0.4
config.enable_tab_bar = false
config.set_environment_variables = { yep = "cock" }

return config
