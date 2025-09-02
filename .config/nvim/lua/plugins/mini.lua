return {
	{
		"echasnovski/mini.nvim",
		event = "VeryLazy",
		version = false,
		config = function()
			require("mini.cursorword").setup({
				delay = 400,
			})
		end,
	},
}
