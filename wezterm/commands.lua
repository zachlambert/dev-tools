local wezterm = require('wezterm')
local act = wezterm.action
local docker = require('docker')

local exports = {}

-- This fails if running at the module scope since run_child_process
-- from docker.get_containers() needs to run in the top-level script
-- not during require('commands')

function exports.spawn_tab_in_domain()
    text ='Which docker image?\n'
    local containers = docker.get_containers()
    for id, name in pairs(containers) do
        text = text..name..'\n'
    end
    return act.PromptInputLine {
        description = wezterm.format {
            { Attribute = { Intensity = 'Bold' } },
            { Foreground = { AnsiColor = 'Fuchsia' } },
            { Text = text }
        },
        action = wezterm.action_callback(function(window, pane, line)
            window:perform_action(act.ReloadConfiguration, pane)
            for id, name in pairs(docker.get_containers()) do
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
end

function exports.apply(config)
    config.exec_domains = {}
    for id, name in pairs(docker.get_containers()) do
        table.insert(
            config.exec_domains,
            wezterm.exec_domain(
                'docker:' .. name,
                docker.make_docker_fixup_func(id),
                docker.make_docker_label_func(id)
            )
        )
    end
end

return exports
