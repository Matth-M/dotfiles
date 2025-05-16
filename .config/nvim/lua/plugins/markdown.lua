-- install without yarn or npm
return {
	{
		"iamcco/markdown-preview.nvim",
		enabled = false,
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		config = function()
			vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreview<cr>", { desc = "MarkdownPreview" })
			vim.keymap.set("n", "<leader>ms", "<cmd>MarkdownPreviewStop<cr>", { desc = "MarkdownPreviewStop" })
			vim.keymap.set("n", "<leader>mt", "<cmd>MarkdownPreviewToggle<cr>", { desc = "MarkdownPreviewToggle" })
		end,
	},
	{
		"ixru/nvim-markdown",
		enabled = false,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		enabled = false,
		ft = "markdown",
		opts = {},
		-- dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
	},
}
