return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		-- Servers are installed and auto-enabled by mason-lspconfig (see lsp/mason.lua).
		-- Formatting is handled by conform (see editor/formatter.lua), not the LSP.

		-- Advertise nvim-cmp's completion capabilities to every server as a shared default.
		vim.lsp.config("*", {
			capabilities = require("cmp_nvim_lsp").default_capabilities(),
		})

		-- Godot's LSP is not managed by mason; enable it directly.
		vim.lsp.enable("gdscript")
	end,
}
