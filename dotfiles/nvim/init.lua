require("config.lazy")

require("lazy").setup({
	{ import = "plugins" },
	{ import = "themes" },
})

require("config.settings")
require("config.keymaps")
require("config.theme")
