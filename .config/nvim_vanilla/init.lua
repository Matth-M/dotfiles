-- test comment
print("This is a block of code with strings literals")
vim.cmd('colorscheme zellner')
vim.api.nvim_command('highlight Comment cterm=italic ctermfg=127')
vim.api.nvim_command('highlight String cterm=italic ctermfg=32')

