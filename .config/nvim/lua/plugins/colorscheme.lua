return {
	-- Install without configuration
	{
		"JManch/sunset.nvim",
		dependencies = {
			{
				"JManch/neovim-ayu",
				event = "VeryLazy",
			},
			-- { "projekt0n/github-nvim-theme", event = "VeryLazy" },
			-- {
			-- 	"bluz71/vim-nightfly-guicolors",
			-- 	event = "VeryLazy",
			-- 	config = function()
			-- 		-- load the colorscheme here
			-- 		vim.cmd([[colorscheme nightfly]])
			-- 	end,
			-- },
			-- {
			-- 	"folke/tokyonight.nvim",
			-- 	event = "VeryLazy",
			-- 	config = function()
			-- 		local bg = "#011628"
			-- 		local bg_dark = "#011423"
			-- 		local bg_highlight = "#143652"
			-- 		local bg_search = "#0A64AC"
			-- 		local bg_visual = "#275378"
			-- 		local fg = "#CBE0F0"
			-- 		local fg_dark = "#B4D0E9"
			-- 		local fg_gutter = "#627E97"
			-- 		local border = "#547998"
			--
			-- 		require("tokyonight").setup({
			-- 			style = "night",
			-- 			on_colors = function(colors)
			-- 				colors.bg = bg
			-- 				colors.bg_dark = bg_dark
			-- 				colors.bg_float = bg_dark
			-- 				colors.bg_highlight = bg_highlight
			-- 				colors.bg_popup = bg_dark
			-- 				colors.bg_search = bg_search
			-- 				colors.bg_sidebar = bg_dark
			-- 				colors.bg_statusline = bg_dark
			-- 				colors.bg_visual = bg_visual
			-- 				colors.border = border
			-- 				colors.fg = fg
			-- 				colors.fg_dark = fg_dark
			-- 				colors.fg_float = fg
			-- 				colors.fg_gutter = fg_gutter
			-- 				colors.fg_sidebar = fg_dark
			-- 			end,
			-- 		})
			-- 		-- load the colorscheme here
			-- 		vim.cmd([[colorscheme tokyonight-night]])
			-- 	end,
			-- },
			-- {
			-- 	"catppuccin/nvim",
			-- 	event = "VeryLazy",
			-- 	priority = 1000,
			-- 	config = function()
			-- 		-- load the colorscheme here
			-- 		vim.cmd([[colorscheme catppuccin]])
			-- 	end,
			-- },
			{
				"rose-pine/neovim",
				event = "VeryLazy",
				cofig = function()
					vim.cmd([[colorscheme rose-pine]])
				end,
			},
			-- { 'nyoom-engineering/oxocarbon.nvim', event = "VeryLazy", },
			{ 'kdheepak/monochrome.nvim',            event = "VeryLazy", },

			{ 'olimorris/onedarkpro.nvim',           event = "VeryLazy", },
			{ '4513ECHO/vim-colors-hatsunemiku',     event = "VeryLazy", },
			{ 'polirritmico/monokai-nightasty.nvim', event = "VeryLazy", },
			{ 'deparr/tairiki.nvim',                 event = "VeryLazy", },
			{ 'projekt0n/github-nvim-theme',         name="github-theme", },
			{
				'uloco/bluloco.nvim',
				event = "VeryLazy",
				dependencies = { 'rktjmp/lush.nvim' },
			},
		},
		lazy = false,
		priority = 1000,
		opts = {
			-- Paris
			latitude = 48.866667,
			longitude = 2.333333,
			day_callback = function()
				vim.o.termguicolors = true
				vim.o.background = "light"
				vim.cmd.colorscheme("monochrome")
				vim.cmd.colorscheme("github_light")
			end,
			night_callback = function()
				vim.o.termguicolors = true
				vim.o.background = "dark"
				-- vim.cmd.colorscheme("monochrome")
				vim.cmd.colorscheme("ayu-dark")
			end,
		},
	},
}
