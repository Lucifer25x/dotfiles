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
  Plug 'mhinz/vim-startify'
call plug#end()

" UI
syntax on
set termguicolors
colorscheme catppuccin_mocha
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set number
set clipboard=unnamedplus
set smartcase
set ignorecase
set incsearch
set hlsearch
set scrolloff=8
set signcolumn=yes
set mouse=a
set shortmess+=I
filetype plugin indent on

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

" Startify
function! CenterText(text, width)
  let l:visible = strwidth(a:text)
  let l:pad = (a:width - l:visible) / 2
  return repeat(' ', max([0, l:pad])) . a:text
endfunction
let s:width = &columns
let g:startify_padding_left = s:width / 2 - 10
let g:startify_custom_header = [
\ '',
\ '',
\ CenterText('██╗   ██╗██╗███╗   ███╗', s:width),
\ CenterText('██║   ██║██║████╗ ████║', s:width),
\ CenterText('██║   ██║██║██╔████╔██║', s:width),
\ CenterText('╚██╗ ██╔╝██║██║╚██╔╝██║', s:width),
\ CenterText(' ╚████╔╝ ██║██║ ╚═╝ ██║', s:width),
\ CenterText('  ╚═══╝  ╚═╝╚═╝     ╚═╝', s:width),
\ '',
\ ]
let g:startify_lists = [
\ { 'type': 'files',    'header': [CenterText('Recent files', s:width)] },
\ { 'type': 'commands', 'header': [CenterText('Shortcuts', s:width)]    },
\ ]
let g:startify_commands = [
\ { 'n': ['NERDTree',           ':NERDTreeToggle'] },
\ { 'f': ['Find files (FZF)',   ':Files']          },
\ { 'g': ['Search text',        ':Rg']             },
\ { 't': ['New tab',            ':tabnew']         },
\ { 'q': ['Quit',               ':q']              },
\ ]
let g:startify_enable_special = 0
