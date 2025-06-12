return {
	"leath-dub/snipe.nvim",
	keys = {
		{
			"gb",
			function()
				require("snipe").open_buffer_menu()
			end,
			desc = "Open Snipe buffer menu",
		},
	},
	opts = {
		ui = {
			---@type integer
			max_height = -1, -- -1 means dynamic height
			-- Where to place the ui window
			-- Can be any of "topleft", "bottomleft", "topright", "bottomright", "center", "cursor" (sets under the current cursor pos)
			---@type "topleft"|"bottomleft"|"topright"|"bottomright"|"center"|"cursor"
			position = "center",
		},
	},
}
