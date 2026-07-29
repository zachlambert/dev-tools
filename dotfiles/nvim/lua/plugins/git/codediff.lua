return {
	"esmuellert/codediff.nvim",
	cmd = "CodeDiff",
	opts = {
		diff = {
			layout = "inline", -- GitHub-style unified view; <leader>dt toggles side-by-side
			cycle_hunks_across_files = true, -- at last hunk of a file, jump to first hunk of next file instead of wrapping
		},
		-- In-view action keymaps are prefixed with <leader>d so `<leader>d` shows them all
		-- in which-key. Only diff-view actions are remapped; the `ih` hunk textobject, `do`/`dp`,
		-- and explorer/history panel navigation (<CR>, K, i, R, z*) keep their defaults.
		keymaps = {
			explorer = {
				select = "o", -- Open the file under the cursor (or toggle a group/directory)
				restore = "<leader>dR", -- Revert the file under the cursor (discard all changes, restore to index/HEAD)
			},
			history = {
				select = "o", -- Open the commit/file under the cursor
			},
			view = {
				next_hunk = "<leader>dj",
				prev_hunk = "<leader>dk",
				next_file = "<leader>dJ",
				prev_file = "<leader>dK",
				stage_hunk = "<leader>ds",
				unstage_hunk = "<leader>du",
				discard_hunk = "<leader>dr",
				toggle_stage = "<leader>d-",
				toggle_layout = "<leader>dt",
				toggle_compact = "<leader>dc",
				toggle_explorer = "<leader>db",
				focus_explorer = "<leader>de",
				quit = "<leader>dq",
				show_help = "<leader>d?",
			},
		},
		explorer = {
			view_mode = "tree",
		},
	},
}
