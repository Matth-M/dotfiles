local map = vim.keymap.set -- vim.api.nvim_set_keymap({mode}, {keymap}, {mapped to}, {option})
local options = { noremap = true }

-- map the leader key
map("n", "<Space>", "", {})
vim.g.mapleader = " " -- 'vim.g' sets global variables

----------------
-- NAVIGATION --
----------------
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

----------------
-- Editing --
----------------
map("n", "VV", "<esc>ggVG", options)
map("n", "Y", "<cmd>%y+<CR>", options)
map("v", "J", ":m '>+1<CR>gv=gv") -- Moves lines in visual mode
map("v", "K", ":m '<-2<CR>gv=gv")
map("x", "<", "<gv")
map("x", ">", ">gv")
map("i", "<c-c>", "<esc>", options)
map({ "n", "v" }, "D", [["_d]], options)
map("x", "<leader>p", [["_dP]])
-- add space before or after line
map("n", "[<space>", "O<esc>", options)
map("n", "]<space>", "o<esc>", options)

----------------
-- Misc
----------------

map("n", "<leader>tn", "<cmd>set invrnu<cr>", options) -- See help :set-inv
map("t", "<esc>", "<C-\\><C-n>", options)

-- https://github.com/mhinz/vim-galore#saner-command-line-history
-- use C-j/k to get next/previous command lines input
map("c", "<C-k>", "<up>", options)
map("c", "<C-j>", "<down>", options)
-- Saner behavior of n and N
-- n goes always forwards, N backwards
vim.cmd([[
nnoremap <expr> n  'Nn'[v:searchforward]
xnoremap <expr> n  'Nn'[v:searchforward]
onoremap <expr> n  'Nn'[v:searchforward]

nnoremap <expr> N  'nN'[v:searchforward]
xnoremap <expr> N  'nN'[v:searchforward]
onoremap <expr> N  'nN'[v:searchforward]
]])