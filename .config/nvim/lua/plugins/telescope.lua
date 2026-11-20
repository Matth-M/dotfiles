return {
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		-- branch = "master",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-tree/nvim-web-devicons",
			{
				"nvim-telescope/telescope-live-grep-args.nvim",
				-- This will not install any breaking changes.
				-- For major updates, this must be adjusted manually.
				version = "^1.0.0",
			},
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")

			telescope.setup({
				defaults = {
					path_display = { "filename_first" },
					cache_picker = {
						num_pickers = -1,
						ignore_empty_prompt = true,
					},
					mappings = {
						i = {
							["<C-c>"] = actions.close,
							["<C-k>"] = actions.move_selection_previous, -- move to prev result
							["<C-j>"] = actions.move_selection_next, -- move to next result
							["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
							["<C-l>"] = actions.cycle_history_next,
							["<C-h>"] = actions.cycle_history_prev,
						},
					},
				},
			})

			telescope.load_extension("fzf")
			-- then load the extension
			telescope.load_extension("live_grep_args")
		end,

		keys = {
			{ "<leader>fc", "<cmd>Telescope colorscheme enable_preview=true<cr>", desc = "Colorscheme" },
			{
				"<leader>ff",
				"<cmd>Telescope find_files<cr>",
				{ desc = "Fuzzy find files in cwd" },
			},
			{
				"<leader>fF",
				"<cmd>lua require('telescope.builtin').find_files({cwd = require('telescope.utils').buffer_dir()})<cr>",
				{ desc = "Fuzzy find files in cwd" },
			},

			{ "<leader>fb", "<cmd>Telescope buffers<cr>",                         { desc = "Fuzzy find buffers" } },
			{ "<leader>fd", "<cmd>Telescope diagnostics<cr>",                     { desc = "Diagnostics" } },
			{
				"<leader>fs",
				"<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
				{ desc = "Live grep" },
			},
			{
				"<leader>fs",
				"<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>",
				{ desc = "Live grep" },
			},

			{ "<leader>fl", "<cmd>Telescope lsp_document_symbols<cr>",          { desc = "Live grep" } },
			{ "<leader>fL", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", { desc = "Live grep" } },

			{
				"<leader>fw",
				"<cmd>Telescope grep_string<cr>",
				{ desc = "Grep for word under cursor" },
			},
			{
				"<leader>fw",
				"<cmd>lua require('telescope-live-grep-args.shortcuts').grep_word_under_cursor() <cr>",
				{ desc = "Grep for word under cursor" },
			},
			{
				"<leader>fW",
				"<cmd>lua require('telescope-live-grep-args.shortcuts').grep_word_under_cursor_current_buffer() <cr>",
				{ desc = "Grep for word under cursor with buffer's directory as root" },
			},

			-- { "gd", "<cmd>Telescope lsp_definitions<cr>", { desc = "Show LSP definitions" } },
			{
				"<leader>fg",
				'<cmd>lua require("telescope.builtin").grep_string({ search = vim.fn.input("grep for> ") })<cr>',
				{ desc = "Grep for a string" },
			},
			{ "<leader>fk", "<cmd>Telescope keymaps<cr>",   { desc = "Search for keymaps" } },
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Search in help" } },
			{ "<leader>fp", "<cmd>Telescope pickers<cr>",   { desc = "Pickers" } },
		},
	},
}
