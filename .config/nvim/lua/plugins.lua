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

    -- completion
    use "neovim/nvim-lspconfig"
    use {
       'hrsh7th/nvim-cmp', -- completion plugin
       requires = {
	   {'hrsh7th/cmp-buffer', opt = true}, -- buffer completion
	   {'hrsh7th/cmp-path', opt = true},  -- path completion
	   {'hrsh7th/cmp-cmdline', opt = true}, --cmdline completion
	   {'saadparwaiz1/cmp_luasnip', opt = true} -- snippet completion
       }
    }

     use "L3MON4D3/LuaSnip"

    -- exploration
    use {
	'kyazdani42/nvim-tree.lua',
	requires = {
	  'kyazdani42/nvim-web-devicons', -- optional, for file icon
	},
	tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

end)
