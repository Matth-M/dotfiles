return {
	"ThePrimeagen/harpoon",
	event = "VeryLazy",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup({})
		-- basic telescope configuration
		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = require("telescope.finders").new_table({
						results = file_paths,
					}),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
				})
				:find()
		end
		vim.keymap.set("n", "<C-n>", function()
			harpoon:list():add()
		end, { desc = "Mark file with harpoon" })

		vim.keymap.set("n", "<C-e>", function()
			toggle_telescope(harpoon:list())
		end, { desc = "Toggle Harpoon quick menu" })

		vim.keymap.set("n", "<C-h>", function()
			harpoon:list():select(1)
		end, { desc = "Select file" })

		vim.keymap.set("n", "<C-j>", function()
			harpoon:list():select(2)
		end, { desc = "Select file" })

		vim.keymap.set("n", "<C-k>", function()
			harpoon:list():select(3)
		end, { desc = "Select file" })

		vim.keymap.set("n", "<C-l>", function()
			harpoon:list():select(4)
		end, { desc = "Select file" })
	end,
}
