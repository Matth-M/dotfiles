local map = vim.api.nvim_set_keymap
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

-- netrw
map("n", "<leader>e", ":NERDTreeFocus<cr>", options)
