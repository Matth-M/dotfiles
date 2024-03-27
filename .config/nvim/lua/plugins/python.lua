return {
	"linux-cultist/venv-selector.nvim",
	dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
	opts = {
		-- Your options go here
		name = "venv",
		-- auto_refresh = false
	},
	ft = "python",
	keys = {
		-- Keymap to open VenvSelector to pick a venv.
		{ "<leader>ps", "<cmd>VenvSelect<cr>", desc = "Select an environment" },
		-- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
		{ "<leader>pc", "<cmd>VenvSelectCached<cr>", desc = "Select a cached environment" },
	},
}
