local wezterm = require('wezterm')
local config = wezterm.config_builder()

local configs = {
    require('keymaps'),
    require('theme'),
}

for _, configs_item in ipairs(configs) do
    for key, value in pairs(configs_item) do
        config[key] = value
    end
end

return config
