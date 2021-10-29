let g:python2_host_prog = $HOME . '/.pyenv/shims/python2'
let g:python3_host_prog = $HOME . '/.pyenv/shims/python3'
" let g:python3_host_prog = '/home/hoshino.h/miniconda3/envs/rllab37/bin/python'

"set nowrap
syntax enable

" disable preview window
set completeopt-=preview
set completeopt+=noinsert
set completeopt=menuone,noinsert

" Set statusline
set laststatus=2

" Set number of lines  after EOF
set scrolloff=10

" Display line number
set nu

" Set spell
set nospell

" Highlight a matching opening or closing parenthesis, square bracket or a curly brace
set showmatch

" Display ruler
set ruler

" Enable incsearch
set incsearch

" Set default indent width
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab

set cursorline
"
" " Height of command line
" set cmdheight=2

" Accessing the system clipboard
set clipboard=unnamed

" Avoid automatic indentation
autocmd InsertLeave *
      \ if &paste | set nopaste mouse=a | echo 'nopaste' | endif |
    \ if &l:diff | diffupdate | endif

" Switch on highlighting the last used search pattern
set hlsearch

" Search while ignoring case
" set ignorecase

" Encode
set encoding=UTF-8

" map keybinds
let mapleader = ","

" Fastest way to move buffer
nnoremap <silent><Left> :bp<CR>
nnoremap <silent><Right> :bn<CR>
nnoremap <silent><C-Space> :call BufferDeleteExceptFiler()<CR>

function! BufferDeleteExceptFiler()
  if (&filetype !=# 'vimfiler')
    bd!
  endif
endfunction

if !has('gui_running')
  augroup term_vim_c_space
    autocmd!
    autocmd VimEnter * map <Nul> <C-Space>
    autocmd VimEnter * map! <Nul> <C-Space>
  augroup END
endif

" Display another buffer when current buffer isn't saved.
set hidden

" Do not create swap files
set noswapfile

" Set clipboard
set clipboard+=unnamedplus

" Set background dark
set background=dark

" Colorscheme
" colorscheme OceanicNext
" colorscheme anderson
" colorscheme brogrammer
" colorscheme falcon
" colorscheme gotham
" colorscheme gruvbox
" colorscheme harlequin
colorscheme iceberg
" colorscheme joker
" colorscheme  lucario
" colorscheme spring-night
" colorscheme molokai
" colorscheme nord
" colorscheme solarized
" colorscheme spacegray
" colorscheme srcery
" colorscheme trash-polka

