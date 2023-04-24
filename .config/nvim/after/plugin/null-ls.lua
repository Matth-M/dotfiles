local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
-- local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	sources = {
		formatting.prettier,
		formatting.black,
		formatting.djlint,
		formatting.fixjson,
		formatting.stylua,
		formatting.clang_format,
		formatting.cmake_format,
		formatting.beautysh,
		formatting.dart_format,
		formatting.gofmt,

		diagnostics.eslint,
		diagnostics.cmake_lint,
		diagnostics.flake8,
	},
})
