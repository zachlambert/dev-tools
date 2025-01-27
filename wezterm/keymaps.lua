local wezterm = require("wezterm")
local act = wezterm.action
local commands = require("commands")

local exports = {}

function exports.apply(config)
	config.leader = {
		key = "a",
		mods = "CTRL",
		timeout_milliseconds = 1000,
	}

	local keymaps = {
		new_tab = { mods = "LEADER", key = "c" },
		new_tab_domain = { mods = "LEADER", key = "C" },
		show_navigator = { mods = "LEADER", key = "w" },
		tab_left = { mods = "ALT", key = "u" },
		tab_right = { mods = "ALT", key = "i" },
		move_tab_left = { mods = "ALT", key = "U" },
		move_tab_right = { mods = "ALT", key = "I" },
		split_horizontal = { mods = "LEADER", key = "s" },
		split_vertical = { mods = "LEADER", key = "v" },
		close_pane = { mods = "LEADER", key = "q" },
		move_left = { mods = "LEADER", key = "h" },
		move_right = { mods = "LEADER", key = "l" },
		move_up = { mods = "LEADER", key = "k" },
		move_down = { mods = "LEADER", key = "j" },
		resize_left = { mods = "ALT", key = "h" },
		resize_right = { mods = "ALT", key = "l" },
		resize_up = { mods = "ALT", key = "k" },
		resize_down = { mods = "ALT", key = "j" },
		reload_config = { mods = "LEADER", key = "r" },
		debug_overlay = { mods = "LEADER", key = "d" },
	}

	local actions = {
		new_tab = act.SpawnTab("CurrentPaneDomain"),
		new_tab_domain = commands.spawn_tab_in_domain(),
		show_navigator = act.ShowTabNavigator,
		tab_left = act.ActivateTabRelative(-1),
		tab_right = act.ActivateTabRelative(1),
		move_tab_left = act.MoveTabRelative(-1),
		move_tab_right = act.MoveTabRelative(1),
		split_horizontal = act({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
		split_vertical = act({ SplitVertical = { domain = "CurrentPaneDomain" } }),
		close_pane = act({ CloseCurrentPane = { confirm = false } }),
		move_left = act.ActivatePaneDirection("Left"),
		move_right = act.ActivatePaneDirection("Right"),
		move_up = act.ActivatePaneDirection("Up"),
		move_down = act.ActivatePaneDirection("Down"),
		resize_left = act({ AdjustPaneSize = { "Left", 2 } }),
		resize_right = act({ AdjustPaneSize = { "Right", 2 } }),
		resize_up = act({ AdjustPaneSize = { "Up", 2 } }),
		resize_down = act({ AdjustPaneSize = { "Down", 2 } }),
		reload_config = act.ReloadConfiguration,
		debug_overlay = act.ShowDebugOverlay,
	}

	config.keys = {}
	for key, value in pairs(keymaps) do
		table.insert(config.keys, {
			key = value["key"],
			mods = value["mods"],
			action = actions[key],
		})
	end
end

return exports
