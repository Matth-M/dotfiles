return {

	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "folke/neodev.nvim",      opts = {} },
		{ "lewis6991/gitsigns.nvim" },
	},
	config = function()
		-- then setup your lsp server as usual
		local lspconfig = require("lspconfig")

		-- -- Need to call lsp-installer setup before the setup of the servers
		-- require("mason").setup()
		-- require("mason-lspconfig").setup()

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local opts = { noremap = true, silent = true }

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()
		--Enable (broadcasting) snippet capability for completion
		capabilities.textDocument.completion.completionItem.snippetSupport = true

		vim.diagnostic.config({
			signs = true,
			virtual_text = { current_line = true },
			severity_sort = true,
		})

		vim.keymap.set('n', '<leader>ld', function()
			local new_config = not vim.diagnostic.config().virtual_text.current_line
			vim.diagnostic.config({ virtual_text = { current_line = new_config } })
		end, { desc = 'Toggle diagnostic virtual_text for only current line' })

		local on_attach = function(_, bufnr)
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
		end

		local servers = {
			{ server = "html" },
			{ server = "clangd" },
			{ server = "pyright" },
			{ server = "bashls" },
			{ server = "gopls" },
			{ server = "ruff" },
			{ server = "zls" },
			{ server = "rust_analyzer" },
			{ server = "verible" },
			{ server = "tinymist" },
			-- { server = "ruby_lsp" },
			{
				server = "lua_ls",
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
			-- { server = "harper_ls" }, -- english spelling
			-- { server = "vhdl_ls" },
			-- { server = "nim_langserver"}
			-- { server = "jsonls",}
			-- { server = "cssls",}
			-- { server = "htmx",}
			-- { server = "marksman",}
			-- { server = "tailwindcss",}
			-- { server = "sqlls",}
			-- { server = "ltex", settings = { ltex = { language = "en-GB" } } }
		}

		for _, lsp in ipairs(servers) do
			vim.lsp.config(lsp.server, lsp.config ~= nil and lsp.config or {})
			lspconfig[lsp.server].setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = (lsp.settings ~= nil and lsp.settings or {}),
			})
		end
		vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", { noremap = true, desc = "LspInfo" })
	end,
}
