return {
	"stevearc/oil.nvim",
	opts = {},
	lazy = false,
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
	keys = {
		{ "-", "<cmd>Oil<cr>", { desc = "Oil", noremap = true } },
	},
}
