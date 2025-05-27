return {
	"folke/which-key.nvim",
	-- enabled = false,
	event = "VeryLazy",
	dependency = {
		{ "echasnovski/mini.icons", version = false },
	},
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	config = function()
		-- you can configure Hop the way you like here; see :h hop-config
		local wk = require("which-key")
		wk.setup({})
		vim.keymap.set("n", "<leader>w", "<cmd>WhichKey<cr>", { desc = "WhichKey" })
		wk.add({
			{ "<leader>i", group = "" },
			{ "<leader>x", group = "Trouble" },
			{ "<leader>t", group = "Toggle" },
			{ "<leader>f", group = "Telescope" },
			{ "<leader>h", group = "Harpoon" },
			{ "<leader>b", group = "Buffers" },
			{ "<leader>d", group = "Debug" },
			{ "<leader>g", group = "Git" },
			{ "<leader>p", group = "Python" },
			{ "<leader>g", group = "DiffView" },
		})
	end,
}
