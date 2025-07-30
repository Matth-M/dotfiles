return {
	{
		'echasnovski/mini.nvim',
		version = false,
		config = function()
			require("mini.cursorword").setup({
				delay = 100,
			})

		end
	},
}
