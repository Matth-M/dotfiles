return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	config = function()
		-- you can configure Hop the way you like here; see :h hop-config
		require("which-key").setup({ keys = "etovxqpdygfblzhckisuran" })
		vim.keymap.set("n", "<leader>w", "<cmd>WhichKey<cr>", { desc = "WhichKey" })
	end,
}
