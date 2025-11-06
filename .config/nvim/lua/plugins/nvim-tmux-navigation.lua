return {
	{
		"alexghergh/nvim-tmux-navigation",
		event = "VeryLazy",
		enabled = false,
		config = function()
			local nvim_tmux_nav = require("nvim-tmux-navigation")
			vim.keymap.set("n", "<A-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
			vim.keymap.set("n", "<A-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
			vim.keymap.set("n", "<A-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
			vim.keymap.set("n", "<A-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
		end,
	},
	{
		"swaits/zellij-nav.nvim",
		lazy = true,
		enabled = false,
		event = "VeryLazy",
		keys = {
			{ "<A-h>", "<cmd>ZellijNavigateLeft<cr>",  { silent = true, desc = "navigate left or tab" } },
			{ "<A-j>", "<cmd>ZellijNavigateDown<cr>",  { silent = true, desc = "navigate down" } },
			{ "<A-k>", "<cmd>ZellijNavigateUp<cr>",    { silent = true, desc = "navigate up" } },
			{ "<A-l>", "<cmd>ZellijNavigateRight<cr>", { silent = true, desc = "navigate right or tab" } },
		},
		opts = {},

		config = function()
			-- NOTE: Ensures that when exiting NeoVim, Zellij returns to normal mode
			vim.api.nvim_create_autocmd("VimLeave", {
				pattern = "*",
				command = "silent !zellij action switch-mode normal"
			})
		end
	},
}
