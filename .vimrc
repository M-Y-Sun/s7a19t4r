" options
set number
set relativenumber

set tabstop=4
set shiftwidth=4

set expandtab
set autoindent

set nowrap

set mouse=v

set backspace=indent,eol,start

set guicursor=n-v-c-i:block

set termguicolors

set clipboard=unnamed

set matchtime=2
set matchpairs+=<:>

set nocompatible
set incsearch
set ruler
set title

" keymaps
"set leader to space
let mapleader = "\<Space>"

" navigation in insert mode using hjkl
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

" insert a new line without leaving normal mode
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>
nnoremap <Leader>x i <Esc>

" tabs
nnoremap <Leader>to :tabnew<CR>
nnoremap <Leader>tx :tabclose<CR>
nnoremap <Leader>tn :tabn<CR>
nnoremap <Leader>tp :tabp<CR>
