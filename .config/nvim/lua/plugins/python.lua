return {
	{
		"linux-cultist/venv-selector.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"mfussenegger/nvim-dap",
			"mfussenegger/nvim-dap-python", --optional
			{ "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
		},
		ft = "python",
		lazy = true,
		config = function()
			require("venv-selector").setup({})
		end,
		keys = {
			-- Keymap to open VenvSelector to pick a venv.
			{ "<leader>ps", "<cmd>VenvSelect<cr>", desc = "Select an environment" },
			-- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
			{ "<leader>pc", "<cmd>VenvSelectCached<cr>", desc = "Select a cached environment" },
		},
	},
	{
		"benomahony/uv.nvim",
		ft = "python",
		config = function()
			require("uv").setup()
		end,
	},
}
