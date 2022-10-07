-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

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
	use { 'fgheng/winbar.nvim' }
    use "p00f/nvim-ts-rainbow"
	use 'karb94/neoscroll.nvim'
	use 'norcalli/nvim-colorizer.lua'
	-- themes
	use 'edeneast/nightfox.nvim'
	use 'sainnhe/sonokai'
	use 'folke/tokyonight.nvim'
	use 'Th3Whit3Wolf/onebuddy'
	use 'tjdevries/colorbuddy.nvim'
	use 'kyazdani42/blue-moon'
	use { "ellisonleao/gruvbox.nvim" }
	use 'ChristianChiarulli/nvcode-color-schemes.vim'

    -- editing
    use "tpope/vim-surround"
    use "jiangmiao/auto-pairs"
	use {
		'numToStr/Comment.nvim',
	}
	use 'tpope/vim-repeat'
	use 'mattn/emmet-vim'

    -- completion
    use 'hrsh7th/nvim-cmp'

	-- cmp sources
    use "hrsh7th/cmp-nvim-lsp"
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'

    use "L3MON4D3/LuaSnip"
    use "saadparwaiz1/cmp_luasnip"

    -- LSP
	use 'neovim/nvim-lspconfig'
	use {
		"williamboman/nvim-lsp-installer",
	}

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

    -- misc
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
	use 'JoosepAlviste/nvim-ts-context-commentstring'
	use 'nvim-treesitter/nvim-treesitter-context'
	use "folke/which-key.nvim"

end)
