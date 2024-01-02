return {
	"folke/flash.nvim",
	event = "VeryLazy",
	---@type Flash.Config
	opts = { modes = {
		char = {
			jump_labels = true,
		},
	} },
	-- config = function()
	-- 	-- require("flash").toggle(false) -- disables search functionality
	-- end,
}
