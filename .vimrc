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
set splitbelow splitright
set nowrap  
set background=dark
set laststatus=2
set noshowmode "" No need since we use lightline
set signcolumn=yes
set directory^=$HOME/.vim/swap// ""Place .swp files in this directory
set completeopt-=preview ""Disable preview window when using completion
set completeopt+=popup 
set tags=./tags;/;
set completepopup=height:10,width:60,highlight:InfoPopup
set autoread
set cursorline

"""""""""""
" Plugins
"""""""""""

" call plug#begin('~/.vim/plugged')
"
" Plug 'vim-utils/vim-man'
" Plug 'kien/ctrlp.vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'itchyny/lightline.vim'
" Plug 'dense-analysis/ale'
" Plug 'tpope/vim-surround'
" Plug 'preservim/nerdtree'
" "Plug 'psliwka/vim-smoothie' "Need updated version of vim or neovim
" Plug 'jeetsukumaran/vim-buffergator'
" Plug 'ap/vim-css-color'
" Plug 'itchyny/vim-gitbranch'
" Plug 'francoiscabrol/ranger.vim'
" Plug 'tpope/vim-fugitive'
" Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
"
" call plug#end()
"
" """""
" " Plugins options
" """""
"
" let NERDTreeNaturalSort = 1
" let g:lightline = {
"     \ 'colorscheme': 'wombat',
"       \ 'active': {
"       \   'left': [ [ 'mode', 'paste' ],
"       \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
"       \ },
"       \ 'component_function': {
"       \   'gitbranch': 'gitbranch#name'
"       \ },
" \ }
"
" if !has('gui-running')
"     set t_Co=256
" endif
"
" "when using ctrlp
" let g:netrw_winsize = 25
" let g:ctrlp_working_path_mode = 'ra'
" let g:ctrlp_show_hidden = 1
"
" "to activate vim-rainbow
" let g:rainbow_active = 1
"
" "Allow custom bindings for buffergator
" let g:buffergator_suppress_keymaps = 1
"
" "Auto close pop-up on auto-complete 
" let g:ycm_autoclose_preview_window_after_completion = 1
"
"
"
" "poppy.vim
" let g:poppy_point_enable = 1

"""""""""""
" Plugins mappings
"""""""""""

" nnoremap <C-x> :call smoothie#upwards()<CR>
" nnoremap <leader>b :BuffergatorToggle<CR>
" nnoremap <leader>g :Git<CR>

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
nnoremap <C-o> <C-o>zz
"nnoremap <C-i> <C-i>zz

nnoremap <leader>r :registers<CR>

nnoremap <C-n> :NERDTreeToggle<CR>

"Buffers
nnoremap <leader>p <C-^>

"Tabs
"<c-i> and Tab are strictly equivalent, if overrides,
"cannot use initial <c-i> use anymore

"nnoremap <Tab> gt
"nnoremap <S-Tab> gT
nnoremap <M-&> :tabmove -<CR>
nnoremap <M-é> :tabmove +<CR>

nnorem  n nzz
nnorem  N Nzz
nnoremap <C-q> :q<CR> 
nnoremap <leader><space> :w<CR>
imap jj <Esc>

"Tags
nnoremap ff <Ctrl-]>
