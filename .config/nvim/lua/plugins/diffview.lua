return {
	"sindrets/diffview.nvim",
	event = "VeryLazy",
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
}
