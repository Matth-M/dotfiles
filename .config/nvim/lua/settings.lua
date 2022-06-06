local o = vim.o
local wo = vim.wo
local bo = vim.bo

-- global settings
o.dir = '/tmp'
o.laststatus = 2
o.incsearch = true
o.ignorecase = true
o.hlsearch = false
o.mouse = "a"
o.showmode = false
o.showtabline = 2
o.splitright = true
o.splitbelow = true
o.smartcase = true
o.shiftwidth = 4
o.scrolloff = 8
o.sidescrolloff = 12

-- window settings
wo.number = true
wo.relativenumber = true
wo.wrap = false
wo.cursorline = true

-- buffer settings
bo.fileencoding = "utf-8"
bo.expandtab = true
bo.swapfile = true
bo.smartindent = true
bo.tabstop = 4
