return {
	"folke/flash.nvim",
	event = "VeryLazy",
	config = function()
		---@type Flash.Config
		local opts = {
			modes = {
				char = {
					jump_labels = true,
					multi_line = false,
				},
				search = {
					highlight = { backdrop = true },
				},
			},
		}
		require("flash").setup(opts)
	end,
}
