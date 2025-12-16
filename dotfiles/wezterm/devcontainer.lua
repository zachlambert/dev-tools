local wezterm = require("wezterm")

local exports = {}

local devcontainer_name = nil

function exports.set_devcontainer_name(name)
	devcontainer_name = name
end

function exports.get_devcontainers()
	return {
		kdnavigation = {
			workspace = "/home/zach/code/navigation/KdNavigation",
			config = "/home/zach/code/navigation/KdNavigation/.devcontainer/devcontainer.json",
		},
	}
end

function exports.make_devcontainer_fixup_func()
	return function(cmd)
		config = exports.get_devcontainers()[devcontainer_name]

		local args = {
			"devcontainer",
			"exec",
			"--workspace-folder",
			config.workspace,
			"--config",
			config.config,
			"zsh",
		}

		cmd.args = args
		return cmd
	end
end

return exports
