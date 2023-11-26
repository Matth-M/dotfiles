return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		require("mini.comment").setup({
			custom_commentstring = function()
				return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
			end,
		})
		require("mini.indentscope").setup()
	end,
}
