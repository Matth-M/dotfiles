local map = vim.keymap.set -- vim.api.nvim_set_keymap({mode}, {keymap}, {mapped to}, {option})
local options = { noremap = true }

-- map the leader key
map("n", "<Space>", "", {})
vim.g.mapleader = " " -- 'vim.g' sets global variables

----------------
-- NAVIGATION --
----------------
-- resize
map("n", "<A-r>h", "<cmd>vertical resize -3<cr>", options)
map("n", "<A-r>j", "<cmd>resize -3<cr>", options)
map("n", "<A-r>k", "<cmd>resize +3<cr>", options)
map("n", "<A-r>l", "<cmd>vertical resize +3<cr>", options)

map("n", "S", "<cmd>split<cr>", options)
map("n", "s", "<cmd>vsplit<cr>", options)
-- Go start, end of line
map({ "n", "x" }, "H", "_", options)
map({ "n", "x" }, "L", "$", options)
-- Center screen when moving
map("n", "<C-u>", "<C-u>zz", options)
map("n", "<C-d>", "<C-d>zz", options)
map("n", "<C-t>", "<C-t>zz", options)
map("n", "<C-o>", "<C-o>zz", options)
map("n", "<C-i>", "<C-i>zz", options)
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("n", "<A-h>", "<C-w>h", options)
map("n", "<A-l>", "<C-w>l", options)
map("n", "<A-k>", "<C-w>k", options)
map("n", "<A-l>", "<C-w>l", options)





-- alternate file
map("n", "<leader><leader>", "<C-^>", options)
map("n", "<c-f>", "<C-^>", options)

-- Quickfix
map("n", "gq", "<cmd>cclose|lclose<cr>", options)

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
map({ "n", "v" }, "C", [["_c]], options)
map("x", "<leader>p", [["_dP]])

-- Go to end/start of line in edit mode
map("i", "<C-e>", "<C-o>$")
map("i", "<C-a>", "<C-o>_")

----------------
-- Misc
----------------

map("n", "<leader>tn", "<cmd>set invrnu<cr>", options) -- See help :set-inv
map("n", "gs", "<cmd>nohlsearch<cr>", options)         -- See help :set-inv
map("t", "<esc>", "<C-\\><C-n>", options)

-- https://github.com/mhinz/vim-galore#saner-command-line-history
-- use C-j/k to get next/previous command lines input
map("c", "<C-k>", "<up>", options)
map("c", "<C-j>", "<down>", options)
-- n goes always forwards, N backwards
vim.cmd([[
nnoremap <expr> n  'Nn'[v:searchforward]
xnoremap <expr> n  'Nn'[v:searchforward]
onoremap <expr> n  'Nn'[v:searchforward]

nnoremap <expr> N  'nN'[v:searchforward]
xnoremap <expr> N  'nN'[v:searchforward]
onoremap <expr> N  'nN'[v:searchforward]
]])
