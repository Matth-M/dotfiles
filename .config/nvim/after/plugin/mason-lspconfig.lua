require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"tsserver",
		"lua_ls",
		"clangd",
		"cssls",
		"cmake",
		"gopls",
		"eslint",
		"html",
		"bashls",
	},
})
