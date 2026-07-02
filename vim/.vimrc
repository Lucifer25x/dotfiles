set nocompatible
call plug#begin()
  Plug 'sheerun/vim-polyglot'
  Plug 'catppuccin/vim', { 'as': 'catppuccin' }
  Plug 'preservim/nerdtree'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'wakatime/vim-wakatime'
  Plug 'tpope/vim-commentary'
  Plug 'ryanoasis/vim-devicons'
  Plug 'jiangmiao/auto-pairs'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" UI
syntax on
set termguicolors
colorscheme catppuccin_mocha
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set number
set relativenumber
set clipboard=unnamedplus
set smartcase
set ignorecase
set incsearch
set hlsearch
set scrolloff=8
set signcolumn=yes
set mouse=a
filetype plugin indent on
set updatetime=300

" Don't yank on delete
nnoremap d "_d
vnoremap d "_d
nnoremap dd "_dd
nnoremap x "_x
vnoremap x "_x1

" coc
nnoremap <F12> <Plug>(coc-definition)
nnoremap gd <Plug>(coc-definition)
nnoremap gr <Plug>(coc-references)
nnoremap <leader>r <Plug>(coc-rename)
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Set indentation
command! Indent2 setlocal ts=2 sts=2 sw=2 et
command! Indent4 setlocal ts=4 sts=4 sw=4 et

" Leader
let mapleader = "\<Space>"

" NERDTree
nnoremap <leader>n  :NERDTreeFocus<CR>
nnoremap <C-n>      :NERDTreeToggle<CR>
nnoremap <C-f>      :NERDTreeFind<CR>

" Close vim if NERDTree is the last window open
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 &&
  \ exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Tabs
nnoremap <C-t>        :tabnew<CR>
nnoremap <C-PageDown> :tabnext<CR>
nnoremap <C-PageUp>   :tabprevious<CR>

" Window navigation
nnoremap <C-Left>  <C-w>h
nnoremap <C-Down>  <C-w>j
nnoremap <C-Up>    <C-w>k
nnoremap <C-Right> <C-w>l

" Window resizing
nnoremap <C-k> :resize +2<CR>
nnoremap <C-j> :resize -2<CR>
nnoremap <C-h> :vertical resize -2<CR>
nnoremap <C-l> :vertical resize +2<CR>

" FZF
nnoremap <leader>p :Files<CR>
nnoremap <leader>g :GFiles<CR>
nnoremap <leader>f :Rg<CR>
nnoremap <leader>b :Buffers<CR>

" Misc
nnoremap <C-s>  :update<CR>
inoremap <C-s>  <Esc>:update<CR>a
nnoremap <C-q>  :q<CR>
inoremap <C-q>  <Esc>:q<CR>
nnoremap <C-_> :Commentary<CR>
vnoremap <C-_> :Commentary<CR>
