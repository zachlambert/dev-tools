local wezterm = require('wezterm')
local docker = require('docker')

local commands = {}

commands.spawn_tab_in_domain = act.PromptInputLine {
    description = wezterm.format {
        { Attribute = { Intensity = 'Bold' } },
        { Foreground = { AnsiColor = 'Fuchsia' } },
        { Text = 'Which docker image?\n'..docker_list_str()}
    },
    action = wezterm.action_callback(function(window, pane, line)
        print('Running action')
        for id, name in pairs(docker_list()) do
            if name==line then
                print('Valid:'..name)
                window:perform_action(
                    act.SpawnTab{DomainName='docker:'..name},
                    pane
                )
            end
        end
    end)
}

return commands
