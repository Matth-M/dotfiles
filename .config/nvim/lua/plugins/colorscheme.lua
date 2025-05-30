return {
	-- Install without configuration
	{
		"JManch/sunset.nvim",
		dependencies = {
			{

				{ "JManch/neovim-ayu" },
				{ "projekt0n/github-nvim-theme" },
				{
					"bluz71/vim-nightfly-guicolors",
					config = function()
						-- load the colorscheme here
						vim.cmd([[colorscheme nightfly]])
					end,
				},
				{
					"folke/tokyonight.nvim",
					config = function()
						local bg = "#011628"
						local bg_dark = "#011423"
						local bg_highlight = "#143652"
						local bg_search = "#0A64AC"
						local bg_visual = "#275378"
						local fg = "#CBE0F0"
						local fg_dark = "#B4D0E9"
						local fg_gutter = "#627E97"
						local border = "#547998"

						require("tokyonight").setup({
							style = "night",
							on_colors = function(colors)
								colors.bg = bg
								colors.bg_dark = bg_dark
								colors.bg_float = bg_dark
								colors.bg_highlight = bg_highlight
								colors.bg_popup = bg_dark
								colors.bg_search = bg_search
								colors.bg_sidebar = bg_dark
								colors.bg_statusline = bg_dark
								colors.bg_visual = bg_visual
								colors.border = border
								colors.fg = fg
								colors.fg_dark = fg_dark
								colors.fg_float = fg
								colors.fg_gutter = fg_gutter
								colors.fg_sidebar = fg_dark
							end,
						})
						-- load the colorscheme here
						vim.cmd([[colorscheme tokyonight-night]])
					end,
				},
				{
					"catppuccin/nvim",
					priority = 1000,
					config = function()
						-- load the colorscheme here
						vim.cmd([[colorscheme catppuccin]])
					end,
				},
				{
					"rose-pine/neovim",
					cofig = function()
						vim.cmd([[colorscheme rose-pine]])
					end,
				},
			},
		},
		lazy = false,
		priority = 1000,
		opts = {
			-- Paris
			latitude = 48.866667,
			longitude = 2.333333,
			day_callback = function()
				vim.o.background = "light"
				vim.cmd.colorscheme("rose-pine-dawn")
			end,
			night_callback = function()
				vim.o.background = "dark"
				vim.cmd.colorscheme("ayu-mirage")
			end,
		},
	},
	{
		"NvChad/nvim-colorizer.lua",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("colorizer").setup({
				filetypes = { "css", " html" },
			})
		end,
	},
}
