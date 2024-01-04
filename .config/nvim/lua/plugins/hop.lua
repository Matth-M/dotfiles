return {
	"smoka7/hop.nvim",
	version = "*",
	event = { "BufReadPre", "BufNewFile" },
	opts = {},
	config = function()
		-- you can configure Hop the way you like here; see :h hop-config
		require("hop").setup()
		vim.keymap.set("n", "<leader>j", "<cmd>HopWordMW<cr>", { desc = "Hop Word" })
	end,
}
