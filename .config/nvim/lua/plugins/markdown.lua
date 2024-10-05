-- install without yarn or npm
return {
	{
		"iamcco/markdown-preview.nvim",
		enabled = false,
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		config = function()
			vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreview<cr>", { desc = "MarkdownPreview" })
			vim.keymap.set("n", "<leader>ms", "<cmd>MarkdownPreviewStop<cr>", { desc = "MarkdownPreview" })
			vim.keymap.set("n", "<leader>mt", "<cmd>MarkdownPreviewToggle<cr>", { desc = "MarkdownPreview" })
		end,
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		"ixru/nvim-markdown",
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = "markdown",
		opts = {},
		-- dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
	},
}
