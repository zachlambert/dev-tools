return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")
		wk.setup({}) -- defaults: popup on prefix, delay ~200ms, reads `desc`
		-- Prefix group labels (leader is ",")
		wk.add({
			{ "<leader>f", group = "Find (Telescope)" },
			{ "<leader>t", group = "Split orientation" },
			{ "<leader>x", group = "Trouble/Diagnostics" },
		})
		-- Key to dump ALL keymaps at once (the "show me everything" window)
		vim.keymap.set("n", "<leader>?", function()
			wk.show({ global = true })
		end, { desc = "Show all keymaps (which-key)" })
	end,
}
