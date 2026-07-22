require("config.lazy")

require("lazy").setup({
	{ import = "plugins.ui" },
	{ import = "plugins.editor" },
	{ import = "plugins.lsp" },
	{ import = "plugins.git" },
	{ import = "themes" },
})

require("config.settings")
require("config.keymaps")
require("config.theme")
