set nocompatible
call plug#begin()
  Plug 'sheerun/vim-polyglot'
  Plug 'catppuccin/vim', {'as':'catppuccin'}
  Plug 'preservim/nerdtree'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'wakatime/vim-wakatime'
  Plug 'tpope/vim-commentary'
  Plug 'ryanoasis/vim-devicons'
call plug#end()

" UI
syntax on
colorscheme catppuccin_mocha
set termguicolors
set number
set encoding=utf-8
filetype plugin indent on

" NERDTree keymaps
let mapleader = "\<Space>"
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n>     :NERDTreeToggle<CR>
nnoremap <C-f>     :NERDTreeFind<CR>

" Tab keymaps
" nnoremap <leader>t :tabnew<CR>
" nnoremap <leader>c :tabclose<CR>
nnoremap <C-t> :tabnew<CR>
nnoremap <C-w> :tabclose<CR>
nnoremap <C-PageDown> :tabnext<CR>
nnoremap <C-PageUp>   :tabprevious<CR>

" Navigation
nnoremap <C-Left> <C-w>h
nnoremap <C-Down> <C-w>j
nnoremap <C-Up>   <C-w>k
nnoremap <C-Right> <C-w>l
nnoremap <C-k>  :resize +2<CR>
nnoremap <C-j>  :resize -2<CR>
nnoremap <C-h>  :vertical resize -2<CR>
nnoremap <C-l>  :vertical resize +2<CR>

" Save/quit
nnoremap <C-s> :update<CR>
nnoremap <C-q> :q<CR>

" Auto-close pairs
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>

