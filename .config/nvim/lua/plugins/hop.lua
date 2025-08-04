return {
	"smoka7/hop.nvim",
	version = "*",
	event = "VeryLazy",
	opts = {},
	config = function()
		-- you can configure Hop the way you like here; see :h hop-config
		require("hop").setup({ uppercase_labels = true })
	end,

	keys = { { "<leader>j", "<cmd>HopCamelCaseMW<cr>", desc = "Hop Word" } },
}
