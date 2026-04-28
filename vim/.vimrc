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
  Plug 'jiangmiao/auto-pairs'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'mhinz/vim-startify'
call plug#end()

" UI
syntax on
set clipboard=unnamedplus
set smartcase
set incsearch
colorscheme catppuccin_mocha
set termguicolors
set number
filetype plugin indent on
set mouse=a
set shortmess+=I

" NERDTree keymaps
let mapleader = "\<Space>"
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n>     :NERDTreeToggle<CR>
nnoremap <C-f>     :NERDTreeFind<CR>

" Tab keymaps
" nnoremap <leader>t :tabnew<CR>
" nnoremap <leader>c :tabclose<CR>
nnoremap <C-t> :tabnew<CR>
" nnoremap <C-w> :tabclose<CR>
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

" FZF
nnoremap <leader>p :Files<CR>
nnoremap <leader>g :GFiles<CR>
nnoremap <leader>f :Rg<CR>

" Other
nnoremap <C-s> :update<CR>
inoremap <C-s> <Esc>:update<CR>a
nnoremap <C-q> :q<CR>
inoremap <C-q> <Esc>:q<CR>
nnoremap <C-/> :Commentary<CR>

" Vim startify
let g:startify_center = 1
let g:startify_custom_header = [
\ '',
\ '',
\ '                    ██╗   ██╗██╗███╗   ███╗',
\ '                    ██║   ██║██║████╗ ████║',
\ '                    ██║   ██║██║██╔████╔██║',
\ '                    ╚██╗ ██╔╝██║██║╚██╔╝██║',
\ '                     ╚████╔╝ ██║██║ ╚═╝ ██║',
\ '                      ╚═══╝  ╚═╝╚═╝     ╚═╝',
\ '',
\ ]
let g:startify_lists = [
\ { 'type': 'files',     'header': ['   Recent files'] },
\ { 'type': 'commands',  'header': ['   Shortcuts'] },
\ ]
let g:startify_commands = [
\ { 'n': ['NERDTree', ':NERDTreeToggle'] },
\ { 'f': ['Find files (FZF)', ':Files'] },
\ { 'g': ['Search text', ':Rg'] },
\ { 't': ['New tab', ':tabnew'] },
\ { 'q': ['Quit', ':q'] },
\ ]
let g:startify_enable_special = 0
