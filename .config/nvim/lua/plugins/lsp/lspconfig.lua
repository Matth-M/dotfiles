return {

	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "folke/neodev.nvim", opts = {} },
		{ "lewis6991/gitsigns.nvim" },
	},
	config = function()
		-- then setup your lsp server as usual
		local lspconfig = require("lspconfig")

		-- Need to call lsp-installer setup before the setup of the servers
		require("mason").setup()
		require("mason-lspconfig").setup()

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local opts = { noremap = true, silent = true }

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()
		--Enable (broadcasting) snippet capability for completion
		capabilities.textDocument.completion.completionItem.snippetSupport = true

		local on_attach = function(_, bufnr)
			opts.buffer = bufnr

			-- set keybinds
			opts.desc = "Show LSP references"
			vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

			opts.desc = "Go to declaration"
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

			opts.desc = "Show LSP definitions"
			-- vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- show lsp definitions

			opts.desc = "Show LSP implementations"
			vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

			opts.desc = "Show LSP type definitions"
			vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

			opts.desc = "See available code actions"
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

			opts.desc = "Smart rename"
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

			opts.desc = "Go to previous diagnostic"
			vim.keymap.set("n", "[d", vim.diagnostic.get_prev, opts) -- jump to previous diagnostic in buffer

			opts.desc = "Go to next diagnostic"
			vim.keymap.set("n", "]d", vim.diagnostic.get_next, opts) -- jump to next disgnostic in buffer

			opts.desc = "Show documentation for what is under cursor"
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

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
			lspconfig[lsp.server].setup({
				on_attach = on_attach,
				capabilities = capabilities,
				settings = (lsp.settings ~= nil and lsp.settings or {}),
			})
		end

		-- specific configurations
		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					completion = {
						callSnippet = "Replace",
					},
					diagnostics = {
						-- set vim as a global variable
						globals = { "vim" },
					},
				},
				workspace = {
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
				},
			},
		})
		vim.keymap.set("n", "<leader>il", "<cmd>LspInfo<cr>", { noremap = true, desc = "LspInfo" })
	end,
}
