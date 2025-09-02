return {
	"nvim-pack/nvim-spectre",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	-- opts = { open_cmd = "noswapfile vnew" },
	keys = {
		{ "<leader>s", "<cmd>Spectre<cr>", mode = "n", desc = "Open Spectre" },
	},
}
