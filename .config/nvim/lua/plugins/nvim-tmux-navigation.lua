return {
	"alexghergh/nvim-tmux-navigation",
	config = function()
		local nvim_tmux_nav = require("nvim-tmux-navigation")
		vim.keymap.set("n", "<A-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
		vim.keymap.set("n", "<A-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
		vim.keymap.set("n", "<A-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
		vim.keymap.set("n", "<A-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
	end,
}
