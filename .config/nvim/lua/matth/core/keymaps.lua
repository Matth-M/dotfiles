local map = vim.keymap.set -- vim.api.nvim_set_keymap({mode}, {keymap}, {mapped to}, {option})
local options = { noremap = true }

-- map the leader key
map("n", "<Space>", "", {})
vim.g.mapleader = " " -- 'vim.g' sets global variables

-- Navigation --
-- splits
-- resize
map("n", "<C-j>", "<cmd>resize -3<cr>", options)
map("n", "<C-h>", "<cmd>vertical resize -3<cr>", options)
map("n", "<C-k>", "<cmd>resize +3<cr>", options)
map("n", "<C-l>", "<cmd>vertical resize +3<cr>", options)
-- change split
map("n", "<A-h>", "<C-w>h", options)
map("n", "<A-j>", "<C-w>j", options)
map("n", "<A-k>", "<C-w>k", options)
map("n", "<A-l>", "<C-w>l", options)
-- create splits
map("n", "ss", "<cmd>split<cr>", options)
map("n", "sv", "<cmd>vs<cr>", options)

-- Go start, end of line
map({ "n", "v" }, "H", "_", options)
map({ "n", "v" }, "L", "$", options)

-- Center screen when moving
map("n", "<C-u>", "<C-u>zz", options)
map("n", "<C-d>", "<C-d>zz", options)
map("n", "<C-t>", "<C-t>zz", options)
map("n", "<C-o>", "<C-o>zz", options)
map("n", "<C-i>", "<C-i>zz", options)
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("n", "<leader><leader>", "<C-^>", options)

map("n", "<M-t>", "<cmd>:tabclose<cr>", options)

-- Editing --
map("n", "VV", "<esc>ggVG", options)
map("n", "Y", "<cmd>%y+<CR>", options)
map("v", "J", ":m '>+1<CR>gv=gv") -- Moves lines in visual mode
map("v", "K", ":m '<-2<CR>gv=gv")
map({ "i", "s" }, "<c-j>", "<cmd>lua require'luasnip'.jump(1)<CR>", options)
map({ "i", "s" }, "<c-k>", "<cmd>lua require'luasnip'.jump(-1)<CR>", options)
map("i", "<c-c>", "<esc>", options)
-- Misc
map("n", "<leader>tn", "<cmd>set invrnu<cr>", options) -- See help :set-inv

map("t", "<esc>", "<C-\\><C-n>", options)
-- map("n", "<leader>tt", "<cmd>tabnew<cr><cmd>terminal<cr>", options) -- See help :set-inv

map("n", "n", "nzz", options)
map("n", "N", "Nzz", options)

map({ "n", "v" }, "D", [["_d]], options)
map("x", "<leader>p", [["_dP]])

-- https://github.com/mhinz/vim-galore#saner-command-line-history
-- vim.keymap.set("c", "<cr>", function()
-- 	if vim.fn.wildmenumode() == 1 then
--
map("c", "<C-k>", "<up>", options)
map("c", "<C-j>", "<down>", options)