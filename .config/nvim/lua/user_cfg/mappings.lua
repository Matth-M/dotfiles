local map = vim.api.nvim_set_keymap -- vim.api.nvim_set_keymap({mode}, {keymap}, {mapped to}, {option})
local options = { noremap = true }

-- map the leader key
map('n', '<Space>', '', {})
vim.g.mapleader = ' '  -- 'vim.g' sets global variables


-- Navigation --
-- splits
-- Add resize mappings
map("n", "<C-h>", "<C-w>h", options)
map("n", "<C-j>", "<C-w>j", options)
map("n", "<C-k>", "<C-w>k", options)
map("n", "<C-l>", "<C-w>l", options)


map("n", "<leader>r", ":registers<cr>", options)

map("n", "<leader>e", ":NvimTreeFocus<cr>", options)
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", options)



-- Misc
map("n", "<leader>s", ":w | source %<cr>", options)
map("n", "<leader>nu", "<cmd>set invrnu<cr>", options) -- See help :set-inv

