local wezterm = require 'wezterm'
local config = wezterm.config_builder()

--config.color_scheme = 'Argonaut'
config.color_scheme = 'Tokyo Night'
--config.color_scheme = 'Afterglow'
config.font = wezterm.font 'JetBrains Mono'

config.enable_tab_bar = false
config.automatically_reload_config = true

config.font_size = 10.0

return config