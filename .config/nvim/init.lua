-- load lazy which loads all plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- install lazy if not found
if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.keymap.set("n", "<leader>iz", "<cmd>Lazy<cr>", { desc = "Open Lazy.nvim ui" })

local opts = {
	checker = {
		enabled = false,
		notify = false,
	},
	change_detection = {
		enabled = true,
		notify = false,
	},
}


require("lazy").setup({ { import = "plugins" }, { import = "plugins.lsp" } }, opts)
require("core")
require("config")
