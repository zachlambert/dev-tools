-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to a comma
vim.g.mapleader = ","

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Disable arrow keys
map("", "<up>", "<nop>")
map("", "<down>", "<nop>")
map("", "<left>", "<nop>")
map("", "<right>", "<nop>")

-- Clear search highlighting with <leader> and h
map("n", "<leader>h", ":nohl<CR>", { desc = "Clear search highlight" })

-- Toggle auto-indenting for code paste
map("n", "<F2>", ":set invpaste paste?<CR>", { desc = "Toggle paste mode" })
-- TODO: The below stopped working, fix
-- vim.opt.pastetoggle = '<F2>'

-- Change split orientation
map("n", "<leader>tk", "<C-w>t<C-w>K", { desc = "Vertical→horizontal split" }) -- change vertical to horizontal
map("n", "<leader>th", "<C-w>t<C-w>H", { desc = "Horizontal→vertical split" }) -- change horizontal to vertical

-- Move around splits using Ctrl + {h,j,k,l}
map("n", "<C-h>", "<C-w>h", { desc = "Go to left split" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to below split" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to above split" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right split" })

-- Reload configuration without restart nvim
map("n", "<leader>r", ":so %<CR>", { desc = "Reload config" })

-- Fast saving with <leader> and s
map("n", "<leader>s", ":w<CR>", { desc = "Save file" })

-- Close all windows and exit from Neovim with <leader> and q
map("n", "<leader>q", ":qa!<CR>", { desc = "Quit all" })

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Terminal mappings
map("n", "<C-t>", ":Term<CR>", { noremap = true, desc = "Open terminal" }) -- open
map("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" }) -- exit

-- NeoTree
map("n", "<C-n>", ":Neotree toggle<CR>", { desc = "Toggle NeoTree" }) -- open/close

-- Barbar
local barbar_opts = { noremap = true, silent = true }
local function barbar_map(lhs, rhs, desc)
	map("n", lhs, rhs, vim.tbl_extend("force", barbar_opts, { desc = desc }))
end

-- Move to previous/next
barbar_map("<A-,>", "<Cmd>BufferPrevious<CR>", "Previous buffer")
barbar_map("<A-.>", "<Cmd>BufferNext<CR>", "Next buffer")
-- Re-order to previous/next
barbar_map("<A-<>", "<Cmd>BufferMovePrevious<CR>", "Move buffer left")
barbar_map("<A->>", "<Cmd>BufferMoveNext<CR>", "Move buffer right")
-- Goto buffer in position...
barbar_map("<A-1>", "<Cmd>BufferGoto 1<CR>", "Go to buffer 1")
barbar_map("<A-2>", "<Cmd>BufferGoto 2<CR>", "Go to buffer 2")
barbar_map("<A-3>", "<Cmd>BufferGoto 3<CR>", "Go to buffer 3")
barbar_map("<A-4>", "<Cmd>BufferGoto 4<CR>", "Go to buffer 4")
barbar_map("<A-5>", "<Cmd>BufferGoto 5<CR>", "Go to buffer 5")
barbar_map("<A-6>", "<Cmd>BufferGoto 6<CR>", "Go to buffer 6")
barbar_map("<A-7>", "<Cmd>BufferGoto 7<CR>", "Go to buffer 7")
barbar_map("<A-8>", "<Cmd>BufferGoto 8<CR>", "Go to buffer 8")
barbar_map("<A-9>", "<Cmd>BufferGoto 9<CR>", "Go to buffer 9")
barbar_map("<A-0>", "<Cmd>BufferLast<CR>", "Go to last buffer")
-- Pin/unpin buffer
barbar_map("<A-p>", "<Cmd>BufferPin<CR>", "Pin buffer")
-- Close buffer
barbar_map("<A-c>", "<Cmd>BufferClose<CR>", "Close buffer")
barbar_map("<A-C>", "<Cmd>BufferCloseAllButCurrent<CR>", "Close other buffers")

-- Language-specific
-- TODO: Only load this if in the correct file
map("n", "<A-o>", "<Cmd>:ClangdSwitchSourceHeader<CR>", { desc = "Switch source/header" })

vim.keymap.set("n", "fr", function()
	require("telescope.builtin").lsp_references()
end, { noremap = true, silent = true, desc = "LSP references" })

-- setup diagnostics
-- vim.diagnostic.config({ virtual_text = false })
vim.keymap.set("n", "<leader>e", function()
	vim.diagnostic.open_float()
end, { noremap = true, desc = "Show diagnostics float" })

vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files in cwd" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep in cwd" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "List open buffers" })
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope git_status<cr>", { desc = "Git status" })
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope git commits<cr>", { desc = "Git commits" })
vim.keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Search all keymaps" })
