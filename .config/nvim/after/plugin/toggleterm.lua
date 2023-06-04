require("toggleterm").setup({
	open_mapping = "<C-Space>",
	direction = "float",
	size = 20,
	float_opts = {
		-- The border key is *almost* the same as 'nvim_open_win'
		-- see :h nvim_open_win for details on borders however
		-- the 'curved' border is a custom border type
		-- not natively supported but implemented in this plugin.
		border = "curved",
		-- like `size`, width and height can be a number or function which is passed the current terminal
		width = function()
			return math.floor(vim.o.columns * 0.8)
		end,
		height = 50,
		-- winblend = 3,
	},
})
