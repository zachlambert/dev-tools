local wezterm = require('wezterm')
local act = wezterm.action
local docker = require('docker')

local exports = {}

function exports.spawn_tab_in_domain()
    return wezterm.action_callback(function(window, pane)
        local choices = {}
        for id, name in pairs(docker.get_containers()) do
            table.insert(choices, { label=name, id=name })
        end
        local choice_callback = function(window, pane, selection)
            docker.set_container(selection)
            window:perform_action(
                act.SpawnTab{DomainName='docker'},
                pane
            )
        end
        window:perform_action(act.InputSelector {
            action = wezterm.action_callback(choice_callback),
            title = 'Select docker container',
            choices = choices,
        }, pane)
    end)
end

function exports.apply(config)
    config.exec_domains = {}
    table.insert(
        config.exec_domains,
        wezterm.exec_domain(
            'docker',
            docker.make_docker_fixup_func(),
            function() return function(name)
                return wezterm.format({
                    Text = 'docker container'
                })
            end end
        )
    )
end

return exports
