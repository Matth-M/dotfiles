return {
	"ThePrimeagen/harpoon",
	event = "VeryLazy",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup({})

		vim.keymap.set("n", "<leader>ha", function()
			harpoon:list():append()
		end, { desc = "Mark file with harpoon" })

		vim.keymap.set("n", "<leader>he", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Toggle Harpoon quick menu" })

		vim.keymap.set("n", "<C-h>", function()
			harpoon:list():select(1)
		end, { desc = "Select file" })

		vim.keymap.set("n", "<C-j>", function()
			harpoon:list():select(2)
		end, { desc = "Select file" })

		vim.keymap.set("n", "<C-k>", function()
			harpoon:list():select(3)
		end, { desc = "Select file" })

		vim.keymap.set("n", "<C-l>", function()
			harpoon:list():select(4)
		end, { desc = "Select file" })

		vim.keymap.set("n", "<C-n>", function()
			harpoon:list():select(5)
		end, { desc = "Select file" })

		vim.keymap.set("n", "<C-m>", function()
			harpoon:list():select(6)
		end, { desc = "Select file" })
	end,
}
