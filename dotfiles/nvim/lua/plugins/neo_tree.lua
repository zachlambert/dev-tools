return {
	{
		"pysan3/neo-tree.nvim",
		branch = "restore-session-experimental",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		lazy = false, -- neo-tree will lazily load itself
		opts = {
			-- recommanded config for better UI
			hide_root_node = true,
			retain_hidden_root_indent = true,
			filesystem = {
				filtered_items = {
					show_hidden_count = false,
					never_show = {
						".DS_Store",
					},
				},
			},
			default_component_configs = {
				indent = {
					with_expanders = true,
					expander_collapsed = "",
					expander_expanded = "",
				},
			},
			auto_restore_session_experimental = true,
		},
		config = function(_, opts)
			opts.nesting_rules = {
				["gd.uid"] = {
					pattern = "(.*)%.gd$",
					files = { "%1%.gd%.uid" },
				},
				["*.png.import"] = {
					files = { "%1%.png%.import" },
					pattern = "(.*)%.png$",
				},
			}
			opts.window = {
				mappings = {
					["o"] = "open", -- Doesn't expand nested files, use space for this
					["od"] = "noop", -- was order_by_diagnostics
					["og"] = "noop", -- was order_by_git_status
					["om"] = "noop", -- was order_by_modified
					["on"] = "noop", -- was order_by_name
					["os"] = "noop", -- was order_by_size
					["ot"] = "noop", -- was order_by_type
					["oc"] = "noop", -- was order_by_created
				},
			}
			require("neo-tree").setup(opts)
		end,
	},
}
