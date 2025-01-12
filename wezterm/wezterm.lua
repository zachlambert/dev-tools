local wezterm = require('wezterm')
local config = wezterm.config_builder()
local docker = require('docker')
local commands = require('commands')

require('theme').apply(config)
require('keymaps').apply(config)
require('commands').apply(config)
print(config.exec_domains)

return config
