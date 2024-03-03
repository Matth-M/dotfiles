-- install without yarn or npm
return {
	{
		"iamcco/markdown-preview.nvim",
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
}
