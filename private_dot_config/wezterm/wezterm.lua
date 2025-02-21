local wezterm = require 'wezterm'
local config = wezterm.config_builder()

--config.color_scheme = 'Argonaut'
config.color_scheme = 'Tokyo Night'
--config.color_scheme = 'Ayu Dark (Gogh)'
config.font = wezterm.font 'JetBrains Mono'
-- Remove ligature
config.harfbuzz_features = { 'calt=0' }

config.enable_tab_bar = false
config.automatically_reload_config = true
config.warn_about_missing_glyphs = false

return config