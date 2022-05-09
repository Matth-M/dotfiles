"""""""""""
" Settings
"""""""""""
set number
set rnu
syntax on
set mouse=a
set encoding=utf-8
set nohlsearch
set incsearch
set noerrorbells
set smartcase
set hidden
set tabstop=4 softtabstop=4
set smartindent
set cindent shiftwidth=4
set shiftwidth=4
set expandtab
set nowrap  
set background=dark
set laststatus=2
set noshowmode "" No need since we use lightline
set signcolumn=yes
set directory^=$HOME/.vim/swap// ""Place .swp files in this directory


"""""""""""
" Plugins
"""""""""""

call plug#begin('~/.vim/plugged')

Plug 'vim-utils/vim-man'
Plug 'kien/ctrlp.vim'
Plug 'ycm-core/YouCompleteMe'
Plug 'mbbill/undotree'
Plug 'itchyny/lightline.vim'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
Plug 'psliwka/vim-smoothie'
Plug 'jeetsukumaran/vim-buffergator'

call plug#end()

"""""
" Plugins options
"""""

let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ }

if !has('gui-running')
    set t_Co=256
endif

"when using ctrlp
let g:netrw_winsize = 25
let g:ctrlp_working_path_mode = 'ra'

"to activate vim-rainbow
let g:rainbow_active = 1

"Allow custom bindings for buffergator
let g:buffergator_suppress_keymaps = 1
"""""""""""
" Mappings
"""""""""""

let mapleader=" "

"Navigation on a window
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
"nnoremap <C-S-h> <C-w><S-h>
"nnoremap <C-S-j> <C-w><S-j>
"nnoremap <C-S-k> <C-w><S-k>
"nnoremap <C-S-l> <C-w><S-l>
nnoremap <C-x> :call smoothie#upwards()<CR>
nnoremap <C-o> <C-o>zz
"nnoremap <C-i> <C-i>zz

nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>b :BuffergatorToggle<CR>
nnoremap <leader>r :registers<CR>

nnoremap <C-n> :NERDTreeToggle<CR>

"Buffers
nnoremap <leader>p <C-^>

"Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <M-&> :tabmove -<CR>
nnoremap <M-é> :tabmove +<CR>

nnoremap <C-q> :q<CR> 
nnoremap <leader><space> :w<CR>
imap jj <Esc>

imap { {}<Esc>i
imap [ []<Esc>i
imap ( ()<Esc>i

"Tags
nnoremap ff <Ctrl-]>
