return {
	"esmuellert/codediff.nvim",
	cmd = "CodeDiff",
	opts = {
		diff = {
			layout = "inline", -- GitHub-style unified view; <leader>dt toggles side-by-side
		},
		-- In-view action keymaps are prefixed with <leader>d so `<leader>d` shows them all
		-- in which-key. Only diff-view actions are remapped; the `ih` hunk textobject, `do`/`dp`,
		-- and the rest of the explorer/history panel navigation (K, i, R, z*) keep their defaults.
		keymaps = {
			explorer = {
				select = "o", -- Open the file under the cursor (or toggle a group/directory)
			},
			history = {
				select = "o", -- Open the commit/file under the cursor
			},
			view = {
				next_hunk = "<leader>d]",
				prev_hunk = "<leader>d[",
				next_file = "<leader>d}",
				prev_file = "<leader>d{",
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
	},
}
