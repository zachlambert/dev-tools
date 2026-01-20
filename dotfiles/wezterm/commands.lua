local wezterm = require("wezterm")
local act = wezterm.action
local docker = require("docker")
local ssh = require("ssh")

local exports = {}

function exports.spawn_tab_in_domain()
	return wezterm.action_callback(function(window, pane)
		local choices = { { label = "host", id = "host" } }
		for id, name in pairs(docker.get_containers()) do
			full_name = "docker:" .. name
			table.insert(choices, { label = full_name, id = full_name })
		end
		for id, _ in pairs(ssh.get_ssh_sessions()) do
			full_name = "ssh:" .. id
			table.insert(choices, { label = full_name, id = full_name })
		end
		local choice_callback = function(window, pane, selection)
			if selection == "host" then
				window:perform_action(act.SpawnTab({ DomainName = "local" }), pane)
			elseif selection:find("docker:") then
				container_name = string.sub(selection, ("docker:"):len() + 1, selection:len())
				docker.set_container(container_name)
				window:perform_action(act.SpawnTab({ DomainName = "docker" }), pane)
			elseif selection:find("ssh:") then
				ssh_session = string.sub(selection, ("ssh:"):len() + 1, selection:len())
				ssh.set_ssh_session(ssh_session)
				window:perform_action(act.SpawnTab({ DomainName = "ssh" }), pane)
			end
		end
		window:perform_action(
			act.InputSelector({
				action = wezterm.action_callback(choice_callback),
				title = "Select docker container",
				choices = choices,
			}),
			pane
		)
	end)
end

function exports.apply(config)
	config.exec_domains = {}
	table.insert(
		config.exec_domains,
		wezterm.exec_domain("docker", docker.make_docker_fixup_func(), function()
			return function(name)
				return wezterm.format({
					Text = "docker container",
				})
			end
		end)
	)
	table.insert(
		config.exec_domains,
		wezterm.exec_domain("ssh", ssh.make_ssh_fixup_func(), function()
			return function(name)
				return wezterm.format({
					Text = "ssh session",
				})
			end
		end)
	)
end

return exports
