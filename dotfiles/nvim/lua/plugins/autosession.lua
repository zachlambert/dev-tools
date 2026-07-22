return {
	"rmagatti/auto-session",
	lazy = false,

	-- NOTE: `sessionoptions` is set in config/settings.lua (the general options file)

	---enables autocomplete for opts
	---@module "auto-session"
	---@type AutoSession.Config
	opts = {
		suppressed_dirs = { "~/", "~/Downloads", "/" },
		-- log_level = 'debug',
	},
}
