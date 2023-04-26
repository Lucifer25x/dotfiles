set nocompatible

" Install Plugins
call plug#begin()
	Plug 'sheerun/vim-polyglot'
	Plug 'joshdick/onedark.vim'
	Plug 'preservim/nerdtree'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'ycm-core/YouCompleteMe'
	Plug 'mattn/emmet-vim'
	Plug 'wakatime/vim-wakatime'
	Plug 'tpope/vim-surround'
	Plug 'vim-syntastic/syntastic'
	Plug 'tpope/vim-commentary'
	Plug 'ryanoasis/vim-devicons'
call plug#end()

" Set
syntax on
colorscheme onedark
set number
set encoding=UTF-8

" Keymaps for NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Use spaces instead of tabs

" For all languages:
" set tabstop     =4
" set softtabstop =4
" set shiftwidth  =4
" set expandtab

" For nim language:
autocmd FileType nim call Nim_settings()

function! Nim_settings()
  setlocal tabstop=4
  setlocal shiftwidth=4
  setlocal softtabstop=4
  setlocal expandtab
endfunction


" Auto close brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

