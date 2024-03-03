return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")

			telescope.setup({
				defaults = {
					path_display = { "truncate " },
					mappings = {
						i = {
							["<C-c>"] = actions.close,
							["<C-k>"] = actions.move_selection_previous, -- move to prev result
							["<C-j>"] = actions.move_selection_next, -- move to next result
							["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
						},
					},
				},
			})

			telescope.load_extension("fzf")
			telescope.load_extension("notify")
		end,
		keys = {
			{ "<leader>fc", "<cmd>Telescope colorscheme enable_preview=true<cr>", desc = "Colorscheme" },
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" } },
			{ "<leader>fd", "<cmd>Telescope diagnostics<cr>", { desc = "Diagnostics" } },
			{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" } },
			{ "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" } },
			{ "<leader>fw", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" } },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find string under cursor in cwd" } },
			{ "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Find string under cursor in cwd" } },
			{ "<leader>fg", "<cmd>Telescope git_files<cr>", { desc = "Search git files" } },
			{ "<leader>fg", "<cmd>Telescope notify<cr>", { desc = "Search Notifications" } },
		},
	},
}
