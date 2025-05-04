return {
	"lervag/vimtex",
	lazy = false, -- we don't want to lazy load VimTeX
	-- tag = "v2.15", -- uncomment to pin to a specific release
	init = function()
		-- VimTeX configuration goes here, e.g.
		vim.g.vimtex_view_method = "zathura"

		vim.g.vimtex_compiler_method = "latexmk"
		vim.g.vimtex_compiler_latexmk_engines = { _ = "-lualatex" }
		vim.g.vimtex_compiler_latexmk = {
			build_dir = "build",
			options = {
				"-lualatex",
				"-pvc",
				"-shell-escape",
				"-verbose",
				"-file-line-error",
				"-synctex=1",
				"-interaction=nonstopmode",
				"-auxdir=build",
				"-outdir=build",
			},
		}
	end,
}
