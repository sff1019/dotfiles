let g:python2_host_prog = $HOME . '/.pyenv/shims/python2'
let g:python3_host_prog = $HOME . '/.pyenv/shims/python3'

"set nowrap
syntax enable

" disable preview window
set completeopt-=preview
set completeopt+=noinsert

" Set statusline
set laststatus=2

" Display line number
set nu

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
" colorscheme harlequin
" colorscheme iceberg
" colorscheme joker
" colorscheme molokai
" colorscheme solarized
" colorscheme srcery
" colorscheme spacegray
" colorscheme nord
colorscheme hybrid_material
