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
			-- stylua is a formatter (used by conform), not a language server. nvim-lspconfig
			-- ships an lsp/stylua.lua that runs `stylua --lsp`, which stylua doesn't support,
			-- so exclude it from mason-lspconfig's automatic server enabling.
			automatic_enable = { exclude = { "stylua" } },
			ensure_installed = {
				"cssls",
				"eslint",
				"html",
				"clangd",
				"jsonls",
				"ts_ls",
				"pyright",
				"tailwindcss",
				-- "cmake",
			},
		})
		-- Formatters used by conform (see editor/formatter.lua); auto-installed on new machines.
		-- Note: conform's `gleam` formatter is the Gleam toolchain binary, not a mason package.
		require("mason-tool-installer").setup({
			ensure_installed = {
				"prettier", -- js/ts/css/html/markdown
				"stylua", -- lua
				-- "black", -- python
				-- "clang-format", -- cpp
				-- "cmakelang", -- provides cmake-format
			},
		})
	end,
}
