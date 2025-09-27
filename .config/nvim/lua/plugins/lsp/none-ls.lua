return {
	{
		"nvimtools/none-ls.nvim", -- configure formatters & linters
		event = { "BufReadPre", "BufNewFile" },
		enabled = false,
		config = function()
			local null_ls = require("null-ls")

			local null_ls_utils = require("null-ls.utils")


			-- for conciseness
			local formatting = null_ls.builtins.formatting -- to setup formatters

			-- configure null_ls
			null_ls.setup({
				-- add package.json as identifier for root (for typescript monorepos)
				root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
				-- setup formatters & linters
				sources = {
					--  to disable file types use
					--  "formatting.prettier.with({disabled_filetypes: {}})" (see null-ls docs)
					formatting.prettier.with({
						extra_filetypes = { "svelte" },
					}), -- js/ts formatter
					formatting.stylua, -- lua formatter
					formatting.isort,
					formatting.black,
					formatting.shfmt,
					formatting.verible_verilog_format,
				},
			})
			vim.keymap.set("n", "<leader>in", "<cmd>NullLsInfo<cr>", { noremap = true, desc = "NullLsInfo" })
		end,
	},
}
