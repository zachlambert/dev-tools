return {
	"EdenEast/nightfox.nvim",
	lazy = false, -- active colorscheme (set in config/theme.lua): load eagerly
	priority = 1000,
	config = function()
		require("nightfox").setup({
			options = {
				transparent = true,
			},
		})
	end,
}
