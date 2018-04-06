call plug#begin('~/.vim/plugged')
	Plug 'tomasr/molokai'
call plug#end()

set laststatus=2
set tabstop=4 " number of visual spaces per TAB
set softtabstop=4 " number of spaces in tab when editing
set autoindent

set number
set showcmd
set ruler
set clipboard=unnamedplus
set showmatch

set hlsearch
set incsearch
set showmatch
colorscheme molokai

set completeopt=menu,preview
