local o = vim.o

o.dir = '/tmp'
o.incsearch = true
o.ignorecase = true
o.hlsearch = false
o.mouse = "a"
o.showmode = false

o.laststatus = 3
o.showtabline = 2
o.winbar = "%f%m"

o.splitright = true
o.splitbelow = true
o.smartcase = true
o.scrolloff = 8
o.sidescrolloff = 12
o.showmode = false
o.hidden = true
o.completeopt= "menu,menuone,noselect"
o.timeout = true
o.timeoutlen = 500
o.number = true
o.relativenumber = true
o.wrap = false
o.cursorline = true
o.signcolumn = "yes"
o.cursorlineopt = "number,line"
o.fileencoding = "utf-8"
o.swapfile = true

o.cindent = true
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 0
o.expandtab = false


vim.cmd(':hi WinSeparator guibg=None')

--  Highlight on yank
vim.cmd[[
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=300}
augroup END
]]
