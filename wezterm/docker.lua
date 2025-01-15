local wezterm = require("wezterm")

local exports = {}

-- All docker containers are associated with the same 'docker' exec domain
-- To select different containers, need to update the variable 'docker_container'
-- - This is because config.exec_domains will only update on re-launching wezterm
--   even if you reload the config
-- - Therefore this is the only way to update the list of docker containers
--   while running
-- - The drawback is that you cannot select the domain from right-click +tab
--   since there is no way to set the docker_container variable here
--   (it will re-use the last set value)

local docker_container = nil

function exports.set_container(name)
	docker_container = name
end

function exports.get_containers()
	local docker_list = {}
	local success, stdout, stderr = wezterm.run_child_process({
		"docker",
		"container",
		"ls",
		"--format",
		"{{.ID}}:{{.Names}}",
	})
	for _, line in ipairs(wezterm.split_by_newlines(stdout)) do
		local id, name = line:match("(.-):(.+)")
		if id and name then
			docker_list[id] = name
		end
	end
	return docker_list
end

function exports.make_docker_fixup_func()
	return function(cmd)
		-- cmd.args = cmd.args or { os.getenv("SHELL") }
		-- NOTE: Currently only support bash in dev container
		cmd.args = cmd.args or { "/usr/bin/bash" }
		local wrapped = {
			"docker",
			"exec",
			"-it",
			docker_container,
		}
		for _, arg in ipairs(cmd.args) do
			table.insert(wrapped, arg)
		end

		cmd.args = wrapped
		return cmd
	end
end

return exports
