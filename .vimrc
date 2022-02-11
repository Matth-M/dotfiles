"""""""""""
" Settings
"""""""""""
set number
syntax on
set nohlsearch
set incsearch
set noerrorbells
set smartcase
set hidden
set tabstop=4 softtabstop=4
set expandtab
set smartindent
set nowrap  
set background=dark
set laststatus=2
set noshowmode "" No need since we use lightline
set signcolumn=yes

"""""""""""
" Plugins
"""""""""""


call plug#begin('~/.vim/plugged')

Plug 'vim-utils/vim-man'
Plug 'kien/ctrlp.vim'
Plug 'ycm-core/YouCompleteMe'
Plug 'mbbill/undotree'
Plug 'frazrepo/vim-rainbow'
Plug 'itchyny/lightline.vim'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-surround'
call plug#end()

let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ }

"when using ctrlp
let g:netrw_winsize = 25

"to activate vim-rainbow
let g:rainbow_active = 1

"""""""""""
" Mappings
"""""""""""

let mapleader=" "

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>u :UndotreeShow<CR>
imap jk <Esc>
imap kj <Esc>
imap jj <Esc>

