-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

return packer.startup(function(use)
    use "wbthomason/packer.nvim"
    use "nvim-lua/plenary.nvim"
    use "nvim-lua/popup.nvim"
    use "neovim/nvim-lspconfig"

    use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use "tpope/vim-surround"
    use "preservim/nerdtree"
    use "jiangmiao/auto-pairs"

    -- completion
     --use {
       --'hrsh7th/nvim-cmp', -- completion plugin
       --requires = {
	   --{'hrsh7th/cmp-buffer', opt = true}, -- buffer completion
	   --{'hrsh7th/cmp-path', opt = true},  -- path completion
	   --{'hrsh7th/cmp-cmdline', opt = true}, --cmdline completion
	   --{'saadparwaiz1/cmp_luasnip', opt = true} -- snippet completion
       --}
     --}

     --use "L3MON4D3/LuaSnip"
     --use "saadparwaiz1/cmp_luasnip"

end)
