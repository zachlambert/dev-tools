return {
	"EdenEast/nightfox.nvim",
	options = {
		transparent = true,
	},
	config = function()
		require("nightfox").setup({
			options = {
				transparent = true,
			},
		})
	end,
}
