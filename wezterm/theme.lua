local wezterm = require('wezterm')
local config = wezterm.config_builder()

-- config.color_scheme = 'One Dark (Gogh)'
config.color_scheme = 'Afterglow'

config.window_background_opacity = 0.92
config.font = wezterm.font('0xProtoNerdFontMono')
config.font_size = 13

config.window_decorations = 'NONE'
config.hide_tab_bar_if_only_one_tab = true
-- config.enable_scroll_bar = true

return config
