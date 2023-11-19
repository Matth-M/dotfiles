local status_ok, nvim_lsp = pcall(require, "lspconfig")
if not status_ok then
	return
end
local util = require("lspconfig/util")

-- Mappings
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, opts)
vim.keymap.set("n", "<leader>dg", vim.diagnostic.get, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<leader>K", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<leader>F", vim.lsp.buf.format, bufopts)

	require("lsp-format").on_attach(client)
end

local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
--Enable (broadcasting) snippet capability for completion
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Need to call lsp-installer setup before the setup of the servers
require("mason").setup()
require("mason-lspconfig").setup()

local lspconfig = require("lspconfig")
local servers = {
	"html",
	"cssls",
	"clangd",
	"pylsp",
	"jsonls",
	"tsserver",
	"bashls",
	"tailwindcss",
	"sqlls",
	"dartls",
	"intelephense",
	"gopls",
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
		lsp_flags = lsp_flags,
	})
end

-- Format plugin
require("lsp-format").setup({ sync = true })

nvim_lsp["clangd"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
	cmd = {
		"clangd",
		"--offset-encoding=utf-16",
	},
})

nvim_lsp["lua_ls"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
})

nvim_lsp["html"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
	filetypes = { "html" },
})

local capabilitiesEmmet = vim.lsp.protocol.make_client_capabilities()
capabilitiesEmmet.textDocument.completion.completionItem.snippetSupport = true
nvim_lsp["emmet_ls"].setup({
	-- on_attach = on_attach,
	capabilities = capabilitiesEmmet,
	filetypes = { "html", "typescriptreact", "javascriptreact", "htmldjango", "php" },
	init_options = {
		html = {
			options = {
				-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
				["bem.enabled"] = true,
			},
		},
	},
})

nvim_lsp.rust_analyzer.setup({
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
	root_dir = util.root_pattern("Cargo.toml"),
	settings = {
		["rust_analyzer"] = {
			cargo = {
				allFeatures = true,
			},
		},
	},
})
