return {
	"folke/flash.nvim",
	event = "VeryLazy",
	enabled = false,
	config = function()
		---@type Flash.Config
		local opts = {
			modes = {
				-- char = {
				-- 	jump_labels = true,
				-- 	multi_line = false,
				-- },
				search = {
					highlight = { backdrop = true },
				},
			},
		}
		require("flash").setup(opts)
	end,
}
