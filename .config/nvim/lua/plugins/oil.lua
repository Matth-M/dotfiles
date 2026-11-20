return {
	"stevearc/oil.nvim",
	opts = { default_file_explorer = true },
	lazy = false,
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "-", "<cmd>Oil<cr>", { desc = "Oil", noremap = true } },
	},
}
