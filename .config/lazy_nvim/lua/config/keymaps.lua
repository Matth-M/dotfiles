-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.del("n", "<C-h>", { desc = "Go to left window", remap = true })
vim.keymap.del("n", "<C-j>", { desc = "Go to lower window", remap = true })
vim.keymap.del("n", "<C-k>", { desc = "Go to left window", remap = true })
vim.keymap.del("n", "<C-l>", { desc = "Go to left window", remap = true })

vim.keymap.set("n", "<A-h>", "<C-w>h", { desc = "Go to left window", remap = true })
vim.keymap.set("n", "<A-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
vim.keymap.set("n", "<A-k>", "<C-w>k", { desc = "Go to left window", remap = true })
vim.keymap.set("n", "<A-l>", "<C-w>l", { desc = "Go to left window", remap = true })
