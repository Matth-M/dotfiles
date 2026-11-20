return {
	{
		"sindrets/diffview.nvim",
		keys = {
			{
				"<leader>gdo",
				"<cmd>DiffviewOpen<cr>",
				desc = "Open diffview",
			},
			{
				"<leader>gdc",
				"<cmd>DiffviewClose<cr>",
				desc = "Close diffview",
			},
		},
	},
	{
		"tanvirtin/vgit.nvim",
		enabled = false,
		dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
		-- Lazy loading on 'VimEnter' event is necessary.
		event = "VimEnter",
		config = function()
			require("vgit").setup()
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		config = function()
			require("gitsigns").setup()
		end,
	},
}
