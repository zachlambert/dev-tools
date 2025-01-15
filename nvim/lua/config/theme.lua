local nightfox = {
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
		vim.cmd("colorscheme nightfox")
	end,
}

local tokyonight = {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		vim.cmd("colorscheme tokyonight-night")
	end,
}

local catppuccin = {
	"catppuccin/nvim",
	name = "catppuccin",
	config = function()
		vim.cmd("colorscheme catppuccin-mocha")
	end,
}
-- Wezterm theme: catppuccin-mocha

local sonokai = {
	"sainnhe/sonokai",
	config = function()
		vim.g.sonokai_style = "atlantis"
		vim.g.sonokai_transparent_background = 1
		vim.cmd("colorscheme sonokai")
	end,
}
-- Wezterm theme:  Neutron

return nightfox
-- return tokyonight
-- return catppuccin
-- return sonokai
