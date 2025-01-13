require("config.lazy")
require("lazy").setup({
	-- File explorer
	{ "kyazdani42/nvim-tree.lua", opts = {} },
	-- Tabs
	require("plugins.barbar"),
	-- Indent line
	{ "lukas-reineke/indent-blankline.nvim" },
	-- Treesitter
	require("plugins.treesitter"),
	-- Autopairs
	require("plugins.autopairs"),
	-- Cmp
	require("plugins.cmp"),
	-- Color highlighter
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({ "*" })
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("colorizer").setup({ "*" })
		end,
	},
	require("plugins.mason"),
	require("plugins.lspconfig"),
	require("plugins.formatter"),
	require("plugins.gitsigns"),
})

require("config.settings")
require("config.keymaps")
