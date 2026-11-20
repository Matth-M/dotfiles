return {
	"ThePrimeagen/harpoon",
	event = "VeryLazy",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup({ settings = { sync_on_ui_close = true, save_on_toggle = true } })
		harpoon:extend({
			UI_CREATE = function(cx)
				vim.keymap.set("n", "<C-v>", function()
					harpoon.ui:select_menu_item({ vsplit = true })
				end, { buffer = cx.bufnr })

				vim.keymap.set("n", "<C-x>", function()
					harpoon.ui:select_menu_item({ split = true })
				end, { buffer = cx.bufnr })

				vim.keymap.set("n", "<C-t>", function()
					harpoon.ui:select_menu_item({ tabedit = true })
				end, { buffer = cx.bufnr })
			end,
		})

		local harpoon_extensions = require("harpoon.extensions")
		harpoon:extend(harpoon_extensions.builtins.highlight_current_file())
		vim.keymap.set("n", "<C-h>", function()
			harpoon:list():add()
		end, { desc = "Mark file with harpoon" })

		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Toggle Harpoon quick menu" })

		vim.keymap.set("n", "<C-j>", function()
			harpoon:list():select(1)
		end, { desc = "Select file" })

		vim.keymap.set("n", "<C-k>", function()
			harpoon:list():select(2)
		end, { desc = "Select file" })

		vim.keymap.set("n", "<C-l>", function()
			harpoon:list():select(3)
		end, { desc = "Select file" })

		vim.keymap.set("n", "<C-n>", function()
			harpoon:list():select(4)
		end, { desc = "Select file" })
		vim.keymap.set("n", "<C-m>", function()
			harpoon:list():select(5)
		end, { desc = "Select file" })
	end,
}

