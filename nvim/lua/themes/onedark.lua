return {
	"navarasu/onedark.nvim",
	config = function()
		require("onedark").setup({
			style = "cool", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
			transparent = true, -- Show/hide background
		})
		-- vim.cmd("colorscheme onedark")
	end,
}
