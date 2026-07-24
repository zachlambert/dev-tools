return {
	"rcarriga/nvim-dap-ui",
	dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	config = function()
		require("dapui").setup({
			mappings = {
				expand = { "<CR>", "o", "<2-LeftMouse>" },  -- Enter, o, or double-click
				open = "O",
			},
		})
		local dap, dapui = require("dap"), require("dapui")

		local function neotree_is_open()
			for _, win in ipairs(vim.api.nvim_list_wins()) do
				local buf = vim.api.nvim_win_get_buf(win)
				if vim.bo[buf].filetype == "neo-tree" then
					return true
				end
			end
			return false
		end

		dap.listeners.before.attach.dapui_config = function()
			neotree_was_open = neotree_is_open()
			if neotree_was_open then vim.cmd("Neotree close") end
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			neotree_was_open = neotree_is_open()
			if neotree_was_open then vim.cmd("Neotree close") end
			dapui.open()
		end

		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
			if neotree_was_open then vim.cmd("Neotree show") end
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
			if neotree_was_open then vim.cmd("Neotree show") end
		end

		vim.fn.sign_define("DapBreakpoint",          { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
		vim.fn.sign_define("DapBreakpointCondition", { text = "◆", texthl = "DapBreakpoint", linehl = "", numhl = "" })
		vim.fn.sign_define("DapStopped",             { text = "▶", texthl = "DapStopped", linehl = "DapStoppedLine", numhl = "" })
	end,
}
