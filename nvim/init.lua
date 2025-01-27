require("config.settings")
require("config.keymaps")

require("config.lazy")
require("lazy").setup({
	-- File explorer
	{ "kyazdani42/nvim-tree.lua", opts = {} },
	-- Gleam (not supported by mason)
	{ "gleam-lang/gleam.vim" },
	-- Tabs
	require("plugins.barbar"),
	-- Indent line
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},
	-- Treesitter
	require("plugins.treesitter"),
	-- Autopairs
	require("plugins.autopairs"),
	-- Cmp
	require("plugins.cmp"),
	require("plugins.lualine"),
	require("plugins.mason"),
	require("plugins.lspconfig"),
	require("plugins.formatter"),
	require("plugins.gitsigns"),
	require("plugins.telescope"),
	{ "sindrets/diffview.nvim" },
	require("plugins.autosession"),
	{ "mfussenegger/nvim-dap" },
	require("plugins.mason_nvim_dap"),
	require("plugins.nvim_dap_ui"),
	require("plugins.trouble"),
	require("config.theme"),
	{ "ntpeters/vim-better-whitespace" },
})
