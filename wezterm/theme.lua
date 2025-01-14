local wezterm = require("wezterm")

local exports = {}

function exports.apply(config)
	config.color_scheme = "Afterglow"

	config.window_background_opacity = 1.0
	-- config.font = wezterm.font('0xProtoNerdFontMono')
	config.font_size = 12

	config.enable_wayland = false
	config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
	config.integrated_title_button_style = "Gnome"
	config.hide_tab_bar_if_only_one_tab = true

	-- Disable ligatures
	config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }
end

return exports
