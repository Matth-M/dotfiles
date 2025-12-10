return {
	-- Install without configuration
	{
		"JManch/sunset.nvim",
		dependencies = {
			{ "JManch/neovim-ayu",                   event = "VeryLazy" },
			{ "rose-pine/neovim",                    event = "VeryLazy" },
			{ "nyoom-engineering/oxocarbon.nvim",    event = "VeryLazy" },
			{ "kdheepak/monochrome.nvim",            event = "VeryLazy" },
			{ "olimorris/onedarkpro.nvim",           event = "VeryLazy" },
			{ "4513ECHO/vim-colors-hatsunemiku",     event = "VeryLazy" },
			{ "polirritmico/monokai-nightasty.nvim", event = "VeryLazy" },
			{ "deparr/tairiki.nvim",                 event = "VeryLazy" },
			{ "projekt0n/github-nvim-theme",         name = "github-theme" },
			{ "uloco/bluloco.nvim",                  event = "VeryLazy",   dependencies = { "rktjmp/lush.nvim" } },
			{ "folke/tokyonight.nvim" },
			{ "EdenEast/nightfox.nvim" },
			{ "catppuccin/nvim" },
			{ "rmehri01/onenord.nvim" },
		},
		lazy = false,
		priority = 1000,
		opts = {
			-- Paris
			latitude = 48.866667,
			longitude = 2.333333,
			day_callback = function()
				vim.o.termguicolors = true
				-- vim.o.background = "light"
				-- vim.cmd.colorscheme("monochrome")
				-- vim.cmd.colorscheme("github_light")

				vim.o.background = "dark"
				vim.cmd.colorscheme("onenord")
			end,
			night_callback = function()
				vim.o.termguicolors = true
				vim.o.background = "dark"
				-- vim.cmd.colorscheme("monochrome")
				vim.cmd.colorscheme("onenord")
			end,
		},
	},
}
