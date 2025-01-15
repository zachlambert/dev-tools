return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({
			automatic_installation = true,
			ensure_installed = {
				"cssls",
				"eslint",
				"html",
				"clangd",
				"jsonls",
				"ts_ls",
				"pyright",
				"tailwindcss",
				"cmake",
			},
		})
		require("mason-tool-installer").setup({
			ensure_installed = {
				"prettier", -- Typescript, etc
				"stylua", -- Lua
				"black", -- Python
				"eslint_d",
				"clang-format",
				-- "cmakelang", -- TODO: Edit the options, defaults aren't good
			},
		})
	end,
}
