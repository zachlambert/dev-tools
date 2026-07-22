return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main", -- new rewrite; no longer uses nvim-treesitter.configs
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		-- Install parsers (replaces the old `ensure_installed` list)
		require("nvim-treesitter").install({
			"json",
			"javascript",
			"typescript",
			"tsx",
			"yaml",
			"html",
			"css",
			"markdown",
			"markdown_inline",
			"bash",
			"lua",
			"vim",
			"dockerfile",
			"gitignore",
			"c",
			"cpp",
			"rust",
			"python",
			"cmake",
			"elixir",
			"eex",
			"heex",
			"gleam",
			"usd",
		})

		-- Enable highlighting + indentation for any buffer that has a parser.
		-- Replaces the old `highlight`/`indent` modules.
		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				local ft = vim.bo[args.buf].filetype
				if not vim.treesitter.language.get_lang(ft) then
					return
				end
				-- pcall: a parser may be declared but not installed yet
				if not pcall(vim.treesitter.start) then
					return
				end
				vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})

		-- autotag now configures itself, independent of treesitter configs
		require("nvim-ts-autotag").setup()
	end,
}
