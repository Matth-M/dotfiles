vim.o.dir = "/tmp"
vim.o.incsearch = true
vim.o.inccommand = "nosplit"
vim.o.ignorecase = true
vim.o.hlsearch = false
vim.o.mouse = "a"
vim.o.showmode = false
vim.o.laststatus = 3
vim.o.showtabline = 1
vim.o.winbar = "%f%m"
-- o.list = true
-- o.listchars = "trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂"
vim.o.clipboard = "unnamedplus"

vim.o.conceallevel = 1
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.smartcase = true
vim.o.scrolloff = 8
vim.o.sidescrolloff = 12
vim.o.showmode = false
vim.o.hidden = true
vim.o.completeopt = "menu,menuone,noselect"
vim.o.timeout = true
vim.o.timeoutlen = 500
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.cursorline = true
vim.o.signcolumn = "yes"
vim.o.cursorlineopt = "number,line"
vim.o.colorcolumn = "100"
vim.o.swapfile = true
vim.o.backupcopy = "yes"

vim.o.cindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 0
vim.o.expandtab = false

-- Make the line separating split thiner
-- vim.cmd(':hi WinSeparator guibg=None')

--  Highlight on yank
vim.cmd([[
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=300}
augroup END
]])

vim.cmd([[
	if has('termguicolors')
		set termguicolors
	endif
]])

vim.cmd([[
" Open help in vertical buffer by default
autocmd! FileType help :wincmd L
]])

-- https://github.com/lewis6991/impatient.nvim#notice
vim.loader.enable()

-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
vim.g.skip_ts_context_commentstring_module = true

-- https://github.com/benlubas/molten-nvim/blob/main/docs/Virtual-Environments.md#point-neovim-at-this-virtual-environment
vim.g.python3_host_prog=vim.fn.expand("~/.virtualenvs/neovim/bin/python3")
