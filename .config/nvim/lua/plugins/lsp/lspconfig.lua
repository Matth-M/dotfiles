return {
	{
		"Fildo7525/pretty_hover",
		event = "LspAttach",
		opts = {}
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "folke/lazydev.nvim",     ft = "lua", opts = {} },
			{ "lewis6991/gitsigns.nvim" },
		},
		config = function()
			local lspconfig = require("lspconfig")

			local opts = { noremap = true, silent = true }

			vim.diagnostic.config({
				signs = true,
				virtual_text = { current_line = true },
				severity_sort = true,
			})

			vim.keymap.set("n", "<leader>ld", function()
				local new_config = not vim.diagnostic.config().virtual_text.current_line
				vim.diagnostic.config({ virtual_text = { current_line = new_config } })
			end, { desc = "Toggle diagnostic virtual_text for only current line" })

			-- local on_attach = function(_, bufnr)
			opts.buffer = bufnr

			-- Keybinds

			opts.desc = "Go to declaration"
			vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts) -- go to declaration

			opts.desc = "Show LSP definitions"
			vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts) -- show lsp definitions

			opts.desc = "Show LSP type definitions"
			vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

			opts.desc = "Go to previous diagnostic"
			vim.keymap.set("n", "[d", "<cmd>vim.diagnostic.get_prev()<cr>", opts) -- jump to previous diagnostic in buffer

			opts.desc = "Go to next diagnostic"
			vim.keymap.set("n", "]d", "<cmd>vim.diagnostic.get_next()<cr>", opts) -- jump to next disgnostic in buffer

			opts.desc = "Show documentation for what is under cursor"
			vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts) -- show documentation for what is under cursor

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
	}, }
