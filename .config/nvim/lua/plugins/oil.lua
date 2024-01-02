return {
	"stevearc/oil.nvim",
	event = "VeryLazy",
	opts = {},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup()
		vim.keymap.set("n", "<leader>o", "<cmd>Oil<cr>", { desc = "Oil", noremap = true })
	end,
}
