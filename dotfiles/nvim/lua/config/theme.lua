-- Colorscheme selection.
-- The chosen theme is persisted to a state file (outside the git-tracked config)
-- and restored on the next startup, so it survives restarts without hardcoding.

local default_theme = "nightfox"

-- Themes offered in the `:Theme` picker (primary colorscheme name per installed plugin)
local themes = {
	"nightfox",
	"tokyonight",
	"rose-pine",
	"onedark",
	"nordic",
	"kanagawa",
	"dracula",
}

-- Runtime state, not the repo (~/.local/state/nvim/theme.txt)
local state_file = vim.fn.stdpath("state") .. "/theme.txt"

local function save_theme(name)
	local f = io.open(state_file, "w")
	if f then
		f:write(name)
		f:close()
	end
end

local function load_saved_theme()
	local f = io.open(state_file, "r")
	if not f then
		return nil
	end
	local name = vim.trim(f:read("*a") or "")
	f:close()
	return name ~= "" and name or nil
end

-- Apply a colorscheme; returns true on success (lazy loads the theme plugin on demand)
local function apply_theme(name)
	local ok = pcall(vim.cmd.colorscheme, name)
	if not ok then
		vim.notify("Unknown colorscheme: " .. name, vim.log.levels.WARN)
	end
	return ok
end

-- Popup to select and persist a theme
local function pick_theme()
	vim.ui.select(themes, { prompt = "Select theme" }, function(choice)
		if choice and apply_theme(choice) then
			save_theme(choice)
		end
	end)
end

vim.api.nvim_create_user_command("Theme", pick_theme, { desc = "Select and persist colorscheme" })

-- Restore the saved theme, falling back to the default
local saved = load_saved_theme()
if not (saved and apply_theme(saved)) then
	apply_theme(default_theme)
end
