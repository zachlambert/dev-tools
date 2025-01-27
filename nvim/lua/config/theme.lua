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
		require("tokyonight").setup({
			transparent = true,
		})
		vim.cmd("colorscheme tokyonight-night")
	end,
}

local catppuccin = {
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
		vim.cmd("colorscheme catppuccin")
	end,
}
-- Wezterm theme: catppuccin-mocha

-- return nightfox
-- return tokyonight
return catppuccin
