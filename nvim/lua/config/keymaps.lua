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

-- Clear search highlighting with <leader> and c
map("n", "<leader>c", ":nohl<CR>")

-- Toggle auto-indenting for code paste
map("n", "<F2>", ":set invpaste paste?<CR>")
-- TODO: The below stopped working, fix
-- vim.opt.pastetoggle = '<F2>'

-- Change split orientation
map("n", "<leader>tk", "<C-w>t<C-w>K") -- change vertical to horizontal
map("n", "<leader>th", "<C-w>t<C-w>H") -- change horizontal to vertical

-- Move around splits using Ctrl + {h,j,k,l}
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Reload configuration without restart nvim
map("n", "<leader>r", ":so %<CR>")

-- Fast saving with <leader> and s
map("n", "<leader>s", ":w<CR>")

-- Close all windows and exit from Neovim with <leader> and q
map("n", "<leader>q", ":qa!<CR>")

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Terminal mappings
map("n", "<C-t>", ":Term<CR>", { noremap = true }) -- open
map("t", "<Esc>", "<C-\\><C-n>") -- exit

-- NvimTree
map("n", "<C-n>", ":NvimTreeToggle<CR>") -- open/close
map("n", "<leader>f", ":NvimTreeRefresh<CR>") -- refresh
map("n", "<leader>n", ":NvimTreeFindFile<CR>") -- search file

-- Tagbar
map("n", "<leader>z", ":TagbarToggle<CR>") -- open/close

-- Barbar
local barbar_opts = { noremap = true, silent = true }

-- Move to previous/next
map("n", "<A-,>", "<Cmd>BufferPrevious<CR>", barbar_opts)
map("n", "<A-.>", "<Cmd>BufferNext<CR>", barbar_opts)
-- Re-order to previous/next
map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", barbar_opts)
map("n", "<A->>", "<Cmd>BufferMoveNext<CR>", barbar_opts)
-- Goto buffer in position...
map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", barbar_opts)
map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", barbar_opts)
map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", barbar_opts)
map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", barbar_opts)
map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", barbar_opts)
map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", barbar_opts)
map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", barbar_opts)
map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", barbar_opts)
map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", barbar_opts)
map("n", "<A-0>", "<Cmd>BufferLast<CR>", barbar_opts)
-- Pin/unpin buffer
map("n", "<A-p>", "<Cmd>BufferPin<CR>", barbar_opts)
-- Close buffer
map("n", "<A-c>", "<Cmd>BufferClose<CR>", barbar_opts)
