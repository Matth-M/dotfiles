return {
	"mluders/comfy-line-numbers.nvim",
	-- event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("comfy-line-numbers").setup({
			-- Line numbers will be completely hidden for the following file/buffer types
			hidden_file_types = { "undotree" },
			hidden_buffer_types = { "terminal", "nofile" },
		})
	end,
}
