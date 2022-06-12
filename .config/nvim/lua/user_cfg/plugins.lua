-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

return packer.startup(function(use)
    -- utility
    use "wbthomason/packer.nvim"
    use "nvim-lua/plenary.nvim"
    use "nvim-lua/popup.nvim"

    -- statusline
    use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- editing
    use "tpope/vim-surround"
    use "jiangmiao/auto-pairs"
    use "lukas-reineke/indent-blankline.nvim"
    use "ap/vim-css-color"

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

--    -- LSP
--    use {
--	{
--	    "williamboman/nvim-lsp-installer",
--	},
--	{
--	    "neovim/nvim-lspconfig",
--	    after = "nvim-lsp-installer",
--	}
--    }

    -- exploration
    use {
	'kyazdani42/nvim-tree.lua',
	requires = {
	  'kyazdani42/nvim-web-devicons', -- optional, for file icon
	},
	tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
    use "p00f/nvim-ts-rainbow"

end)
