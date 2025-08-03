-- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
return {
	"numToStr/Comment.nvim",
	-- event = { "BufReadPre", "BufNewFile" },
	event = "VeryLazy",
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
		config = function()
			require("ts_context_commentstring").setup({})
		end,
	},
	opts = {
		toggler = {
			---Line-comment toggle keymap
			line = "gcc",
		},
		---LHS of operator-pending mappings in NORMAL and VISUAL mode
		opleader = {
			---Line-comment keymap
			line = "gc",
		},
		---Enable keybindings
		---NOTE: If given `false` then the plugin won't create any mappings
		mappings = {
			---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
			basic = false,
			---Extra mapping; `gco`, `gcO`, `gcA`
			extra = false,
		},
	},
}
