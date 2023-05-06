-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

return packer.startup(function(use) -- :PackerSync
	-- utility
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")
	use("nvim-lua/popup.nvim")

	-- Appearance
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	use("kyazdani42/nvim-web-devicons")
	use({ "fgheng/winbar.nvim" })
	use("p00f/nvim-ts-rainbow")
	use("norcalli/nvim-colorizer.lua")
	use("lukas-reineke/indent-blankline.nvim")
	-- themes
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("ChristianChiarulli/nvcode-color-schemes.vim")
	use("folke/tokyonight.nvim")
	use("navarasu/onedark.nvim")
	use("Mofiqul/dracula.nvim")
	use("Mofiqul/vscode.nvim")
	use("EdenEast/nightfox.nvim")
	use("rebelot/kanagawa.nvim")
	use({ "rose-pine/neovim", as = "rose-pine" })

	-- editing
	use("tpope/vim-surround")
	use("windwp/nvim-autopairs")
	use({
		"numToStr/Comment.nvim",
	})
	use("tpope/vim-repeat")
	use("mattn/emmet-vim")
	use("cshuaimin/ssr.nvim")
	use("mbbill/undotree")

	-- completion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")

	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")
	-- Packer
	use("rafamadriz/friendly-snippets")

	-- LSP
	use("neovim/nvim-lspconfig")
	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })
	use("jose-elias-alvarez/null-ls.nvim")
	use({
		"ThePrimeagen/refactoring.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	})

	-- exploration
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
		tag = "nightly",           -- optional, updated every week. (see issue #1193)
	})
	use("nvim-telescope/telescope.nvim")
	use({ "nvim-telescope/telescope-file-browser.nvim" })
	use("ThePrimeagen/harpoon")
	use("phaazon/hop.nvim")
	use("alexghergh/nvim-tmux-navigation")

	-- misc
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("nvim-treesitter/nvim-treesitter-context")
	use({ "kevinhwang91/nvim-bqf", ft = "qf" })
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")
	use({ "akinsho/toggleterm.nvim", tag = "*" })

	--git
	-- use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
	use("tpope/vim-fugitive")
	use("ThePrimeagen/git-worktree.nvim")
	use({
		"lewis6991/gitsigns.nvim",
		-- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
	})

	-- optional
	use({
		"junegunn/fzf",
		run = function()
			vim.fn["fzf#install"]()
		end,
	})
end)
