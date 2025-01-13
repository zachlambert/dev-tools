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
		local protocol = require("vim.lsp.protocol")

		local on_attach = function(client, bufnr)
			-- format on save
			if client.server_capabilities.documentFormattingProvider then
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = vim.api.nvim_create_augroup("Format", { clear = true }),
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format()
					end,
				})
			end
		end

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		handlers = {
			function(server)
				nvim_lsp[server].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end,
		}

		lsp_servers = {
			"ts_ls",
			"cssls",
			"tailwindcss",
			"html",
			"jsonls",
			"eslint",
			"pyright",
			"clangd",
		}
		for _, lsp_server in ipairs(lsp_servers) do
			handlers[lsp_server] = function()
				nvim_lsp[lsp_server].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end
		end

		mason_lspconfig.setup_handlers(handlers)
	end,
}
