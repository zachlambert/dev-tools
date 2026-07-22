return {
	"AlexvZyl/nordic.nvim",
	config = function()
		require("nordic").setup({
			transparent = {
				bg = true,
			},
			visual = {
				theme = "light",
			},
		})
	end,
}
