local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'Argonaut'
--config.color_scheme = 'Tokyo Night'
config.font = wezterm.font 'JetBrains Mono'

config.enable_tab_bar = false
config.automatically_reload_config = false

return config