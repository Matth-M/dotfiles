return {
	"kevinhwang91/nvim-bqf",
	event = "QuickFixCmdPre",
	dependencies = {
		-- {
		-- 	"junegunn/fzf",
		-- 	build = function()
		-- 		vim.fn["fzf#install"]()
		-- 	end,
		-- },
		{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	},
	ft = "qf",
}
