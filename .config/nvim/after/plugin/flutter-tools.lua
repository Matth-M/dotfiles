require("flutter-tools").setup({
	widget_guides = {
		enabled = true,
	},
	dev_log = {
		enabled = true,
		open_cmd = "tabedit",
	},
}) -- use defaults

vim.keymap.set("n", "<leader>Fr", "<cmd>FlutterReload<cr>")
vim.keymap.set("n", "<leader>Fo", "<cmd>FlutterOutlineToggle<cr>")
vim.keymap.set("n", "<leader>FF", "<cmd>Telescope flutter commands<cr>")

require("telescope").load_extension("flutter")
