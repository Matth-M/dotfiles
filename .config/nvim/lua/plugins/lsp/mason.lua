return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"jay-babu/mason-nvim-dap.nvim",
		"mfussenegger/nvim-dap",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")
		local mason_nvim_dap = require("mason-nvim-dap")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true, -- not the same as ensure_installed
		})

		mason_nvim_dap.setup({
			ensure_installed = {},
			automatic_installation = false,
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				"pylint", -- python linter
				"cpptools",
				"codelldb",
				"clangd",
				"shfmt",
				"zls",
				"lua_ls",
				"sqlls",
				"gopls",
				"verible",
				"bashls",
				"pyright",
			},
		})

		vim.keymap.set("n", "<leader>im", "<cmd>Mason<cr>", { desc = "Open Mason UI" })
	end,
}
