local map = vim.api.nvim_set_keymap -- vim.api.nvim_set_keymap({mode}, {keymap}, {mapped to}, {option})
local options = { noremap = true }

-- map the leader key
map('n', '<Space>', '', {})
vim.g.mapleader = ' '  -- 'vim.g' sets global variables

map('n', '<leader>n', ':bnext<cr>', options)



-- Navigation --
-- splits
map("n", "<C-h>", "<C-w>h", options)
map("n", "<C-j>", "<C-w>j", options)
map("n", "<C-k>", "<C-w>k", options)
map("n", "<C-l>", "<C-w>l", options)


map("n", "<leader>r", ":registers<cr>", options)



----- PLugins --------
map("n", "<leader>e", ":NvimTreeFocus<cr>", options)
map("n", "<leader>ec", ":NvimTreeClose<cr>", options)
