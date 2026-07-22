return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local nvim_lsp = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")

		-- NOTE: Formatting is handled by the conform plugin already

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local handlers = {
			function(server)
				nvim_lsp[server].setup({
					capabilities = capabilities,
				})
			end,
		}

		local lsp_servers = {
			"ts_ls",
			"cssls",
			"tailwindcss",
			"html",
			"jsonls",
			"eslint",
			"pyright",
			"clangd",
			"cmake",
			"buf_ls",
		}
		for _, lsp_server in ipairs(lsp_servers) do
			handlers[lsp_server] = function()
				nvim_lsp[lsp_server].setup({
					capabilities = capabilities,
				})
			end
		end

		nvim_lsp.gdscript.setup({})

		mason_lspconfig.setup({ handlers = handlers })
	end,
}
