return {
	{
		-- Change to https://github.com/mrcjkb/rustaceanvim
		"simrat39/rust-tools.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"neovim/nvim-lspconfig",
		},
		config = function()
			local rt = require("rust-tools")

			-- Update this path
			local extension_path = vim.env.HOME .. "/.vscode/extensions/vadimcn.vscode-lldb-1.6.7/"
			local codelldb_path = extension_path .. "adapter/codelldb"
			local liblldb_path = extension_path .. "lldb/lib/liblldb"
			local this_os = vim.loop.os_uname().sysname

			-- The path in windows is different
			if this_os:find("Windows") then
				codelldb_path = extension_path .. "adapter\\codelldb.exe"
				liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
			else
				-- The liblldb extension is .so for linux and .dylib for macOS
				liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
			end

			rt.setup({
				server = {
					on_attach = function(_, bufnr)
						local opts = { noremap = true, silent = true, buffer = bufnr }

						-- Hover actions
						opts.desc = "Hover action"
						vim.keymap.set("n", "K", rt.hover_actions.hover_actions, opts)
						-- Code action groups
						opts.desc = "Code action"
						vim.keymap.set("n", "<leader>ca", rt.code_action_group.code_action_group, opts)

						opts.desc = "Rust Debuggables"
						vim.keymap.set("n", "<leader>dr", "<cmd>RustDebuggables<cr>", opts)

						opts.desc = "Show LSP references"
						vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

						opts.desc = "Go to declaration"
						vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

						opts.desc = "Show LSP definitions"
						vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

						opts.desc = "Show LSP implementations"
						vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

						opts.desc = "Show LSP type definitions"
						vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

						opts.desc = "See available code actions"
						vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

						opts.desc = "Smart rename"
						vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

						opts.desc = "Show buffer diagnostics"
						vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

						opts.desc = "Go to previous diagnostic"
						vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

						opts.desc = "Go to next diagnostic"
						vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next disgnostic in buffer

						opts.desc = "Show documentation for what is under cursor"
						vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

						opts.desc = "Restart LSP"
						vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
					end,
				},
				dap = {
					adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
				},
			})
		end,
	},
}
