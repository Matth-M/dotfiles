return {
	"LunarVim/bigfile.nvim",
	event = "BufReadPre",
	enabled = false,
	opts = {
		filesize = 2, -- size of the file in MiB, the plugin kicks in for files larger than this limit
	},
	config = function(_, opts)
		require("bigfile").setup(opts)
	end,
}
