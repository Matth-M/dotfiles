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
		local wk = require("which-key")
		wk.setup({ keys = "etovxqpdygfblzhckisuran" })
		vim.keymap.set("n", "<leader>w", "<cmd>WhichKey<cr>", { desc = "WhichKey" })
		wk.register({
			i = {
				name = "Info", -- optional group name
			},
			x = {
				name = "Trouble", -- optional group name
			},
			t = {
				name = "Toggle", -- optional group name
			},
			f = {
				name = "Telescope", -- optional group name
			},
			h = {
				name = "Harpoon", -- optional group name
			},
			b = {
				name = "Buffers", -- optional group name
			},
			d = {
				name = "Debug", -- optional group name
			},
			g = {
				name = "Git", -- optional group name
			},
			gd = {
				name = "DiffView", -- optional group name
			},
		}, { prefix = "<leader>" })
	end,
}
