return {
	"nvimdev/hlsearch.nvim",
	-- event = "BufEnter",
	config = function()
		require("hlsearch").setup()
	end,
}
