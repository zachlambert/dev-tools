local wezterm = require("wezterm")

local exports = {}

local ssh_session = nil

function exports.set_ssh_session(value)
	ssh_session = value
end

function exports.get_ssh_sessions()
	local ssh_list = {}
	local success, stdout, stderr = wezterm.run_child_process({ "ps", "aux" })
	for _, line in ipairs(wezterm.split_by_newlines(stdout)) do
		if line:find("ssh") then
			local user, server = line:match(".*ssh (.*)@(.*)")
			if user and server then
				id = user .. "@" .. server
				ssh_list[id] = { user, server }
			end
		end
	end
	return ssh_list
end

function exports.make_ssh_fixup_func()
	return function(cmd)
		cmd.args = cmd.args or { "/usr/bin/bash" }
		local wrapped = {
			"ssh",
			ssh_session,
			"-t",
			"-X",
		}
		for _, arg in ipairs(cmd.args) do
			table.insert(wrapped, arg)
		end

		cmd.args = wrapped
		return cmd
	end
end

return exports
