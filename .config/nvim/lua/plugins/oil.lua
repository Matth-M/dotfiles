return {
	"stevearc/oil.nvim",
	opts = {},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup()
	end,
	keys = {
		{ "-", "<cmd>Oil<cr>", { desc = "Oil", noremap = true } },
	},
}
