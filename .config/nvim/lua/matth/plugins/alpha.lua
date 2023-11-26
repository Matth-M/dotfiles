return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		dashboard.section.header.val = {
			[[                               __                ]],
			[[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
			[[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
			[[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
			[[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
			[[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
		}
		dashboard.section.buttons.val = {
			dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("f", "  Search file", "<cmd>Telescope find_files<cr>"),
			dashboard.button("r", " Recent", "<cmd>Telescope oldfiles<cr>"),
			dashboard.button("c", " Config", "<cmd>lua require('matth.utils').telescope_find_config_files()<cr>"),
			dashboard.button("g", " Grep", "<cmd>Telescope live_grep<cr>"),
			dashboard.button("l", "󰒲 Lazy", "<cmd>Lazy<cr>"),
			dashboard.button("m", " Mason", "<cmd>Mason<cr>"),
			dashboard.button("q", "󰅚  Quit NVIM", ":qa<CR>"),
		}

		dashboard.config.opts.noautocmd = true
		alpha.setup(dashboard.opts)
		alpha.setup(dashboard.config)
		vim.cmd([[autocmd User AlphaReady echo 'ready']])
		vim.keymap.set("n", "<leader>A", "<cmd>Alpha<cr>", {})
	end,
}
