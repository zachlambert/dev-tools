local wezterm = require("wezterm")
local config = wezterm.config_builder()
local docker = require("docker")
local ssh = require("ssh")
local commands = require("commands")

require("theme").apply(config)
require("keymaps").apply(config)
require("commands").apply(config)

return config
