return {
	"folke/tokyonight.nvim",
	opts = {},
	config = function()
		require("tokyonight").setup({
			transparent = true,
		})
		-- vim.cmd("colorscheme tokyonight-night")
	end,
}
