return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	enabled = false,
	-- ft = "markdown",
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	event = {
		-- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		-- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
		-- refer to `:h file-pattern` for more examples
		"BufReadPre "
			.. vim.fn.expand("~")
			.. "/Documents/obsidian/*.md",
		"BufNewFile " .. vim.fn.expand("~") .. "/Documents/obsidian/*.md",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("obsidian").setup({
			ui = { enable = false },
			workspaces = {
				{
					name = "personal",
					path = "~/Documents/obsidian",
				},
			},
			templates = {
				folder = "Templates",
				date_format = "%Y-%m-%d-%a",
				time_format = "%H:%M",
			},
			mappings = {
				-- Smart action depending on context, either follow link or toggle checkbox.
				["<cr>"] = {
					action = function()
						return require("obsidian").util.smart_action()
					end,
					opts = { buffer = true, expr = true },
					desc = "Smart action"
				},
				-- Toggle check-boxes.
				["<leader>oc"] = {
					action = function()
						return require("obsidian").util.toggle_checkbox()
					end,
					opts = { buffer = true },
					desc="Toggle checkbox",
				},
			},
			wiki_link_func = "prepend_note_path",
			attachments = {
				-- The default folder to place images in via `:ObsidianPasteImg`.
				-- If this is a relative path it will be interpreted as relative to the vault root.
				-- You can always override this per image by passing a full path to the command instead of just a filename.
				img_folder = "Attachements",
			},
		})
		vim.keymap.set("n", "<leader>of", "<cmd>ObsidianQuickSwitch<cr>", { desc = "Open obsidian quick switch" })
		vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianTemplate<cr>", { desc = "Use template" })
		vim.keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<cr>", { desc = "Search in vault" })
	end,
}
