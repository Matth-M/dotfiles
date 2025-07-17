return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "master",
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
							["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
						},
					},
				},
			})

			telescope.load_extension("fzf")
		end,

		keys = {
			{ "<leader>fc", "<cmd>Telescope colorscheme enable_preview=true<cr>", desc = "Colorscheme" },
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" } },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Fuzzy find buffers" } },
			{ "<leader>fd", "<cmd>Telescope diagnostics<cr>", { desc = "Diagnostics" } },
			{ "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" } },

			{ "<leader>fw", "<cmd>Telescope grep_string<cr>", { desc = "Grep for word under cursor" } },
			-- { "gd", "<cmd>Telescope lsp_definitions<cr>", { desc = "Show LSP definitions" } },
			{
				"<leader>fg",
				'<cmd>lua require("telescope.builtin").grep_string({ search = vim.fn.input("grep for> ") })<cr>',
				{ desc = "Grep for a string" },
			},
			{ "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Search for keymaps" } },
		},
	},
}
