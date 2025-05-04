return {
	"catppuccin/nvim",
	name = "catppuccin",
	config = function()
		require("catppuccin").setup({
			flavour = "mocha",
			transparent_background = true,
			integrations = {
				nvimtree = true,
			},
			highlight_overrides = {
				mocha = function(mocha)
					return {
						NvimTreeNormal = { bg = mocha.none },
					}
				end,
			},
		})
		-- vim.cmd("colorscheme catppuccin")
	end,
}
