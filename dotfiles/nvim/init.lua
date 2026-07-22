require("config.lazy")

-- Set leaders before lazy loads any plugins, so plugin <leader> mappings resolve correctly
vim.g.mapleader = ","
vim.g.maplocalleader = ","

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
