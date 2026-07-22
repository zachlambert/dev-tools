return {
	"nvim-telescope/telescope.nvim",
	branch = "master",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim", -- routes vim.ui.select through a Telescope popup
	},
	config = function()
		require("telescope").setup({
			defaults = {
				file_ignore_patterns = {
					"build",
					"node_modules",
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
			},
		})
		require("telescope").load_extension("ui-select")
	end,
}
