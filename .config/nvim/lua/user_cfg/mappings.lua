local map = vim.keymap.set -- vim.api.nvim_set_keymap({mode}, {keymap}, {mapped to}, {option})
local options = { noremap = true }

-- map the leader key
map("n", "<Space>", "", {})
vim.g.mapleader = " " -- 'vim.g' sets global variables

-- Navigation --
-- splits
-- resize
map("n", "<A-j>", "<cmd>resize -3<cr>", options)
map("n", "<A-h>", "<cmd>vertical resize -3<cr>", options)
map("n", "<A-k>", "<cmd>resize +3<cr>", options)
map("n", "<A-l>", "<cmd>vertical resize +3<cr>", options)
-- change split
map("n", "<C-h>", "<C-w>h", options)
map("n", "<C-j>", "<C-w>j", options)
map("n", "<C-k>", "<C-w>k", options)
map("n", "<C-l>", "<C-w>l", options)

-- Go start, end of line
map({ "n", "v" }, "H", "_", options)
map({ "n", "v" }, "L", "$", options)

map("n", "<C-u>", "<C-u>zz", options)
map("n", "<C-d>", "<C-d>zz", options)
map("n", "<C-t>", "<C-t>zz", options)
map("n", "<C-o>", "<C-o>zz", options)
map("n", "<C-i>", "<C-i>zz", options)
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("n", "<leader><leader>", "<C-^>", options)

map("n", "<M-t>", "<cmd>:tabclose<cr>", options)

map("n", "<leader>r", ":registers<cr>", options)

-- Editing --
-- map("i", "jj", "<esc>", options)
map("n", "VV", "<esc>ggVG", options)
map("v", "J", ":m '>+1<CR>gv=gv") -- Moves lines in visual mode
map("v", "K", ":m '<-2<CR>gv=gv")

-- Misc
map("n", "<leader>ss", ":w | source %<cr>", options)
map("n", "<leader>tn", "<cmd>set invrnu<cr>", options) -- See help :set-inv

map("t", "<esc>", "<C-\\><C-n>", options)
-- map("n", "<leader>tt", "<cmd>tabnew<cr><cmd>terminal<cr>", options) -- See help :set-inv

map("n", "n", "nzz", options)
map("n", "N", "Nzz", options)
