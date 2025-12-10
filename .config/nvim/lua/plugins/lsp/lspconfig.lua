return {
	{
		"Fildo7525/pretty_hover",
		event = "LspAttach",
		opts = {},
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "folke/lazydev.nvim",     ft = "lua", opts = {} },
			{ "lewis6991/gitsigns.nvim" },
		},
		config = function()
			-- local lspconfig = require("lspconfig")

			local opts = { noremap = true, silent = true }

			vim.diagnostic.config({
				signs = true,
				virtual_text = { current_line = true },
				severity_sort = true,
			})

			opts.desc = "Toggle diagnostic virtual_text for only current line"
			vim.keymap.set("n", "<leader>ld", function()
				local new_config = not vim.diagnostic.config().virtual_text.current_line
				vim.diagnostic.config({ virtual_text = { current_line = new_config } })
			end, opts)

			-- Keybinds
			opts.desc = "Go to declaration"
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

			opts.desc = "Show LSP definitions"
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- show lsp definitions

			-- opts.desc = "Go to previous diagnostic"
			-- vim.keymap.set("n", "[d", vim.diagnostic.get_prev, opts) -- jump to previous diagnostic in buffer
			--
			-- opts.desc = "Go to next diagnostic"
			-- vim.keymap.set("n", "]d", vim.diagnostic.get_next, opts) -- jump to next disgnostic in buffer

			-- opts.desc = "Show documentation for what is under cursor"
			-- vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts) -- show documentation for what is under cursor

			opts.desc = "Open line diagnostic in floating window."
			vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts) -- mapping to restart lsp if necessary

			opts.desc = "Restart LSP"
			vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
			-- end

			local servers = {
				html = {},
				clangd = {},
				pyright = {},
				bashls = {},
				gopls = {},
				ruff = {},
				zls = {},
				rust_analyzer = {},
				verible = {},
				tinymist = {},
				lua_ls = {
					settings = {
						Lua = {
							diagnostics = {
								-- set vim as a global variable
								globals = { "vim" },
							},
							completion = {
								callSnippet = "Replace",
							},
						},
						workspace = {
							library = {
								[vim.fn.expand("$VIMRUNTIME/lua")] = true,
								[vim.fn.stdpath("config") .. "/lua"] = true,
							},
						},
					},
				},
			}

			for server, config in pairs(servers) do
				vim.lsp.config(server, config ~= nil and config or {})
				vim.lsp.enable(server)
			end
			vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", { noremap = true, desc = "LspInfo" })
		end,
	},
}
