require("mason-lspconfig").setup {
    ensure_installed = {
	"jedi_language_server", --python
	"tsserver" ,
	"sumneko_lua",
	"clangd",
	"cssls",
    },
}
