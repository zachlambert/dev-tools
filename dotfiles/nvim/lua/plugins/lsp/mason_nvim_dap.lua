return {
	"jay-babu/mason-nvim-dap.nvim",
	config = function()
		local dap = require("dap")
		dap.adapters.lldb = {
			type = "executable",
			command = "/usr/bin/lldb-dap", -- REQUIRE: sudo apt install lldb
			name = "lldb",
		}
		dap.configurations.cpp = {
			{
				name = "Attach to gdbserver :1234",
				type = "lldb",
				request = "attach",
				attachCommands = {
					"gdb-remote localhost:1234",
				},
				cwd = "${workspaceFolder}",
			},
			-- Add back in needed, otherwise always use the above action
			{
				name = "Attach to process",
				type = "lldb",
				request = "attach",
				pid = require("dap.utils").pick_process, -- prompts you to pick
				cwd = "${workspaceFolder}",
			},
		}
	end,
}
