-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

return packer.startup(function(use) -- :PackerSync
	-- utility
	use "wbthomason/packer.nvim"
	use "nvim-lua/plenary.nvim"
	use "nvim-lua/popup.nvim"

	-- Appearance
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	use 'kyazdani42/nvim-web-devicons'
	use { 'fgheng/winbar.nvim' }
	use "p00f/nvim-ts-rainbow"
	use 'norcalli/nvim-colorizer.lua'
	-- themes
	use 'ChristianChiarulli/nvcode-color-schemes.vim'
	use 'folke/tokyonight.nvim'
	use 'Shatur/neovim-ayu'
	use "lukas-reineke/indent-blankline.nvim"

	-- editing
	use "tpope/vim-surround"
	use "jiangmiao/auto-pairs"
	use {
		'numToStr/Comment.nvim',
	}
	use 'tpope/vim-repeat'
	use 'mattn/emmet-vim'
	use 'cshuaimin/ssr.nvim'

	-- completion
	use 'hrsh7th/nvim-cmp'
	use "hrsh7th/cmp-nvim-lsp"
	use 'hrsh7th/cmp-nvim-lua'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'

	use "L3MON4D3/LuaSnip"
	use "saadparwaiz1/cmp_luasnip"

	-- LSP
	use 'neovim/nvim-lspconfig'
	use { "williamboman/mason.nvim" }
	use { "williamboman/mason-lspconfig.nvim" }

	-- exploration
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons', -- optional, for file icon
		},
		tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}
	use "nvim-telescope/telescope.nvim"
	use { "nvim-telescope/telescope-file-browser.nvim" }
	use "ThePrimeagen/harpoon"
	use "phaazon/hop.nvim"

	-- misc
	use {
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	}
	use 'JoosepAlviste/nvim-ts-context-commentstring'
	use 'nvim-treesitter/nvim-treesitter-context'
	use { 'kevinhwang91/nvim-bqf', ft = 'qf' }

	--git
	use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

	-- optional
	use { 'junegunn/fzf', run = function()
		vim.fn['fzf#install']()
	end
	}

end)