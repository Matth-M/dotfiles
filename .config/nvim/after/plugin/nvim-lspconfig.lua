-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>dl', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
	vim.keymap.set('n', '<leader>K', vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set('n', '<leader>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
	vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
	vim.keymap.set('n', '<leader>F', vim.lsp.buf.format, bufopts)
end

local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}


-- Need to call lsp-installer setup before the setup of the servers
require("mason").setup()
require("mason-lspconfig").setup()

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

require('lspconfig')['pyright'].setup {
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities
}

require('lspconfig')['jsonls'].setup {
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities
}

require('lspconfig')['tsserver'].setup {
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities
}

require('lspconfig')['clangd'].setup {
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities
}

require('lspconfig')['sumneko_lua'].setup {
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities,
	setting = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { 'vim' },
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
}

require('lspconfig')['html'].setup {
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities
}

require('lspconfig')['cssls'].setup {
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities
}

require('lspconfig')['bashls'].setup {
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities
}

require('lspconfig')['ltex'].setup {
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities
}

require('lspconfig')['ghdl_ls'].setup {
	on_attach = on_attach,
	flags = lsp_flags,
	capabilities = capabilities
}

require('lspconfig')['emmet_ls'].setup {
    -- on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
    init_options = {
      html = {
        options = {
          -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
          ["bem.enabled"] = true,
        },
      },
    }
}
