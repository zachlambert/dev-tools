-----------------------------------------------------------
-- Keymaps for Neovim and installed plugins.
-----------------------------------------------------------

-- NOTE: leader keys are set in init.lua, before lazy loads plugins

-- Convenience function for adding a keymap
-- The description will show up in which-key
local function map(mode, lhs, rhs, desc)
	vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
end

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Disable arrow keys
map("", "<up>", "<nop>")
map("", "<down>", "<nop>")
map("", "<left>", "<nop>")
map("", "<right>", "<nop>")

map("n", "<leader>h", ":nohl<CR>", "Clear search highlight")

-- Move around splits using Ctrl + {h,j,k,l}
map("n", "<C-h>", "<C-w>h", "Go to left split")
map("n", "<C-j>", "<C-w>j", "Go to below split")
map("n", "<C-k>", "<C-w>k", "Go to above split")
map("n", "<C-l>", "<C-w>l", "Go to right split")

map("n", "<leader>s", ":w<CR>", "Save file")
map("n", "<leader>q", ":qa!<CR>", "Quit all")

-----------------------------------------------------------
-- Applications and plugin shortcuts
-----------------------------------------------------------

-- NeoTree
map("n", "<C-n>", ":Neotree toggle<CR>", "Toggle NeoTree")

-- Popup to choose which buffers to close (barbar has no single "close all")
local function close_buffers_menu()
	local actions = {
		{
			desc = "LEFT - Close buffers to the left",
			run = function()
				vim.cmd("BufferCloseBuffersLeft")
			end,
		},
		{
			desc = "RIGHT - Close buffers to the right",
			run = function()
				vim.cmd("BufferCloseBuffersRight")
			end,
		},
		{
			desc = "OTHER - Close other buffers",
			run = function()
				vim.cmd("BufferCloseAllButCurrent")
			end,
		},
		{
			desc = "ALL - Close all buffers",
			run = function()
				vim.cmd("BufferCloseAllButCurrent")
				vim.cmd("BufferClose")
			end,
		},
	}
	vim.ui.select(actions, {
		prompt = "Close buffers",
		format_item = function(item)
			return item.desc
		end,
	}, function(choice)
		if choice then
			choice.run()
		end
	end)
end

-- Barbar (buffer tabs)
map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", "Previous buffer")
map("n", "<A-.>", "<Cmd>BufferNext<CR>", "Next buffer")
map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", "Move buffer left")
map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", "Move buffer right")
map("n", "<A-c>", "<Cmd>BufferClose<CR>", "Close buffer")
map("n", "<A-C>", close_buffers_menu, "Close buffers…")

-- LSP / language-specific
-- TODO: only map <A-o> in C/C++ buffers
map("n", "<A-o>", "<Cmd>ClangdSwitchSourceHeader<CR>", "Switch source/header")
map("n", "fr", "<cmd>Telescope lsp_references<cr>", "LSP references")
map("n", "<leader>e", vim.diagnostic.open_float, "Show diagnostics float")

-- UI
map("n", "<leader>ut", "<cmd>Theme<cr>", "Select theme")

-- CodeDiff (review - diff)
map("n", "<leader>dd", "<cmd>CodeDiff<cr>", "Diff explorer (working tree)")

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", "Find files in cwd")
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", "Live grep in cwd")
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", "List open buffers")
map("n", "<leader>fs", "<cmd>Telescope git_status<cr>", "Git status")
map("n", "<leader>fc", "<cmd>Telescope git commits<cr>", "Git commits")
map("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", "Search all keymaps")

-- Markdown preview
map("n", "<leader>mm", "<cmd>MarkdownPreviewToggle<cr>", "Toggle markdown preview")

-- Dap
local dap = require("dap")
local function goto_code_win()
  -- if current window is a dap-ui / special buffer, jump to the previous (code) window
  local ft = vim.bo.filetype
  if ft:match("^dap") or ft == "dapui_watches" or ft == "dap-repl" then
    vim.cmd("wincmd p")
  end
end
map("n", "<leader>gg", "<cmd>DapNew<cr>", "Debugger: Start")
map("n", "<leader>gq", "<cmd>DapDisconnect<cr>", "Debugger: Quit")
map("n", "<leader>gk", function() goto_code_win(); dap.up() end, "Debugger: Up")
map("n", "<leader>gj", function() goto_code_win(); dap.down() end, "Debugger: Down")
map("n", "<leader>gb", "<cmd>DapToggleBreakpoint<cr>", "Debugger: Toggle Breakpoint")
map("n", "<leader>gc", "<cmd>DapContinue<cr>", "Debugger: Continue")
map("n", "<leader>gC", "<cmd>DapStepOver<cr>", "Debugger: Step Over")
map("n", "<leader>gK", "<cmd>DapStepOut<cr>", "Debugger: Step Out")
map("n", "<leader>gJ", "<cmd>DapStepInto<cr>", "Debugger: Step Into")
