" vimrc

" Only for nvim
if !has('nvim')
	set ttymouse=xterm2
endif

"set nowrap
syntax enable

" Flags {{{
let s:use_dein = 1
" }}}

" FileType {{{
au BufRead,BufNewFile *.md set filetype=markdown | let b:noStripWhitespace=1
au BufRead,BufNewFile *.haml set filetype=haml | let b:noStripWhitespace=1
au BufRead,BufNewFile,BufReadPre *.coffee set filetype=coffee
au BufRead,BufNewFile,BufReadPre *.swift set filetype=swift
"}}}

" Indentation settings {{{
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2 et
autocmd Filetype css setlocal ts=4 sw=4 sts=0
autocmd FileType javascript setlocal ts=2 sw=2 et
autocmd Filetype coffee setlocal ts=2 sts=2 sw=2 et
autocmd FileType swift imap <buffer> <C-k> <Plug>(autocomplete_swift_jump_to_placeholder)
autocmd Filetype typescript setlocal ts=2 sts=2 sw=2 et
" }}}

" Dein {{{
let s:vimdir = $HOME . '/.vim'
let s:dein_dir = s:vimdir . '/dein'
let s:dein_github = s:dein_dir . '/repos/github.com'
let s:dein_repo_name = "Shougo/dein.vim"
let s:dein_repo_dir = s:dein_github . '/' . s:dein_repo_name
let s:rsense_dir = $HOME . '/.rbenv/shims/rsense'

"  Install dein automatically
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif

if &compatible
  set nocompatible
endif

let &runtimepath = &runtimepath . "," . s:dein_repo_dir

if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)

	call dein#add('Shougo/dein.vim')

  " Plugin async loader
	call dein#add('Shougo/vimproc.vim', {
		\ 'build' : {
		\     'windows' : 'tools\\update-dll-mingw',
		\     'cygwin' : 'make -f make_cygwin.mak',
		\     'mac' : 'make -f make_mac.mak',
		\     'unix' : 'make -f make_unix.mak',
		\    },
		\ })

  " Completion
	call dein#add('Shougo/deoplete.nvim')
	call dein#add('zchee/deoplete-jedi')
	call dein#add('jiangmiao/auto-pairs')

  " Linter
	call dein#add('w0rp/ale')
  call dein#add('Quramy/tsuquyomi', {'rev': 'db073bb'})

  " Syntax highlight
	call dein#add('fatih/vim-go')
	call dein#add('keith/swift.vim')
	call dein#add('pangloss/vim-javascript')
	call dein#add('mxw/vim-jsx')
	call dein#add('maxmellon/vim-jsx-pretty')
	call dein#add('wlangstroth/vim-racket')
	call dein#add('godlygeek/tabular')
	call dein#add('rcmdnk/vim-markdown')
	call dein#add('kannokanno/previm')
	call dein#add('tyru/open-browser.vim')
	call dein#add('posva/vim-vue')
	call dein#add('JuliaEditorSupport/julia-vim')
  call dein#add('leafgarland/typescript-vim')

  " Statusline
	call dein#add('vim-airline/vim-airline')
	call dein#add('vim-airline/vim-airline-themes')

	" Filer
	call dein#add('Shougo/vimfiler.vim', {'depends': 'unite.vim'})

  " Git
	call dein#add('airblade/vim-gitgutter')
	call dein#add('tpope/vim-fugitive')

  " Util
	call dein#add('tomtom/tcomment_vim')
	call dein#add('vim-scripts/YankRing.vim')
	call dein#add('rhysd/accelerated-jk')
	call dein#add('thinca/vim-quickrun')
  call dein#add('nathanaelkane/vim-indent-guides')

	" Colorization
	call dein#add('vim-scripts/AnsiEsc.vim')
	call dein#add('bronson/vim-trailing-whitespace')
	call dein#add('chrisbra/Colorizer')

	" Rails
	call dein#add('tpope/vim-rails')

	" Colorscheme
	" call dein#add('nielsmadan/harlequin')
	" call dein#add('ajh17/Spacegray.vim')
	" call dein#add('whatyouhide/vim-gotham')
	" call dein#add('fenetikm/falcon')
  call dein#add('sff1019/vim-brogrammer-theme')
  " call dein#add('znake/znake-vim')
	" call dein#add('sjl/badwolf')
	" call dein#add('jdsimcoe/panic.vim')
	" call dein#add('sff1019/vim-joker')

	" Denite.nvim
	call dein#add('Shougo/unite.vim')
	call dein#add('ujihisa/unite-colorscheme')

  " FZF
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })

  " LATEX
  call dein#add('lervag/vimtex')

  " OpenCL
  call dein#add('brgmnn/vim-opencl')

	" Multiple selection
	call dein#add('terryma/vim-multiple-cursors')

	call dein#end()
endif
" }}}

" Plugin settings {{{

" accelerated-jk
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

" enable plugin, indent
filetype plugin indent on

" ale
if dein#tap('ale')
	" let g:ale_python_flake8_executable = 'python2'
	" let g:ale_python_flake8_args = '-m flake8'
  " let g:ale_python_flake8_use_global = 0

	let g:ale_swift_swiftlint_executable = 'swiftlint'
	let g:ale_swift_swiftlint_options = ''
	let g:syntastic_python_checker_args='--ignore=E501'

	let g:ale_linters = {
				\   'javascript': ['eslint'],
				\   'python': ['flake8'],
				\   'go': ['gofmt'],
				\   'swift': ['swiftlint'],
        \   'typescript': ['tslint'],
				\}
	let g:ale_fixers = {
				\   'javascript': ['eslint'],
				\   'python': ['autopep8'],
				\   'go': ['gofmt'],
				\}
	let g:ale_fix_on_save = 1
endif

"Colorizer
if dein#tap('Colorizer')
	autocmd BufNewFile,BufRead *.css,*.scss,*.html,*.htm  :ColorHighlight!
endif

" ctrlp.vim
if dein#tap('fzf.vim')
    command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg -g "!node_modules/*" --column --line-number  --no-heading --color=always '.shellescape(<q-args>), 0,
    \   fzf#vim#with_preview({'options': '--exact --delimiter : --nth 3..'}, 'right:50%'))
    nnoremap <silent> <C-t> :FZF<CR>
    nnoremap ,g :Rg<CR>
  endif

" deoplete
if dein#tap('deoplete.nvim')
	let g:python2_host_prog = $HOME . '/.pyenv/shims/python2'
	let g:python3_host_prog = $HOME . '/.pyenv/shims/python3'
	let g:deoplete#enable_at_startup = 1
	if !exists('g:deoplete#omni#input_patterns')
		let g:deoplete#omni#input_patterns = {}
	endif
	let g:deoplete#auto_complete_delay = 0
  let g:deoplete#auto_complete_start_length = 1
	autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
endif

" neoterm
if dein#tap('neoterm')
	let g:neoterm_size = 80
	let g:neoterm_position = 'vertical'
endif

" previm
if dein#tap('previm')
	let g:previm_open_cmd = 'open -a Google\ Chrome'
endif


" quickrun
if dein#tap('quickrun')
	let g:quickrun_config = {}
endif

" vim-airline
if dein#tap('vim-airline')
	let g:airline_theme='distinguished'
	let g:airline#extensions#tabline#enabled = 1
	set laststatus=2
	let g:airline_powerline_fonts = 1
	" let g:airline#extensions#tabline#fnamemod = ':t'
endif

" vim-coffee-script
if dein#tap('vim-coffee-script')
	autocmd QuickFixCmdPost * nested cwindow | redraw!
	nnoremap <silent> <C-C> :CoffeeCompile vert <CR><C-w>h
endif

" vimfiler
if dein#tap('vimfiler.vim')
	let g:vimfiler_as_default_explorer = 1
	let g:vimfiler_restore_alternate_file = 1
	let g:vimfiler_safe_mode_by_default=0
	let g:vimfiler_tree_indentation = 1
	let g:vimfiler_tree_leaf_icon = '¦'
	let g:vimfiler_tree_opened_icon = '▼'
	let g:vimfiler_tree_closed_icon = '▷'
	let g:vimfiler_file_icon = '-'
	let g:vimfiler_readonly_file_icon = '*'
	let g:vimfiler_marked_file_icon = '√'
	" let g:vimfiler_ignore_pattern = '^\%(.DS_Store/)$'

	nnoremap <silent> <C-\> :<C-u>VimFilerExplorer -force-hide -split -simple -winwidth=30 -no-quit<CR>
	autocmd VimEnter * VimFilerExplorer -force-hide -split -simple -winwidth=30 -no-quit
	autocmd FileType vimfiler call s:vimfilerinit()
	function! s:vimfilerinit()
		set nonumber
	endfunction
endif

if dein#tap('vim-go')
	let g:go_def_mapping_enabled = 0
endif

" vim-javascript
if dein#tap('vim-javascript')
	let g:javascript_plugin_jsdoc = 1
endif

"vim-jsx-pretty
if dein#tap('vim-jsx-pretty')
	let g:vim_jsx_pretty_colorful_config = 1
endif

"vim-jsx-pretty
if dein#tap('vim-jsx')
	let g:jsx_ext_required = 0
endif

" vim-markdown
if dein#tap('vim-markdown')
	let g:vim_markdown_folding_disabled = 1
endif

if dein#tap('vimtex')
	let g:vimtex_latexmk_enabled = 1
	let g:tex_flavor='latex'
	let g:vimtex_compiler_latexmk_engines = { '_' : '-pdfdvi' }
	let g:vimtex_compiler_latexmk = {
            \ 'background' : 0,
            \ 'build_dir' : '',
            \ 'continuous' : 1,
            \ 'options' : [
            \   '-pdfdvi',
            \   '-verbose',
            \   '-file-line-error',
            \   '-synctex=1',
            \   '-interaction=nonstopmode',
            \ ],
            \}
	let g:tex_conceal = ''
	let g:vimtex_view_general_viewer = '/Applications/Skim.app/Contents/SharedSupport/displayline'
	let g:vimtex_view_general_options = '@line @pdf @tex'
endif

" vim-trailing-whitespace
if dein#tap('vim-trailing-whitespace')
	" Delete whitespace automatically when current file is saved
	autocmd BufWritePre *  call s:StripTrailingWhitespace()
	fun! s:StripTrailingWhitespace()
		" Only strip if the b:noStripeWhitespace variable isn't set
		if exists('b:noStripWhitespace')
			return
		endif
		:FixWhitespace
	endfun
endif

" vim-multiple-cursors
if dein#tap('vim-multiple-cursors')
	let g:multi_cursor_use_default_mapping=0

	" Default mapping
	let g:multi_cursor_start_word_key      = '<C-m>'
	let g:multi_cursor_select_all_word_key = '<C-,>'
	let g:multi_cursor_start_key           = 'g<C-m>'
	let g:multi_cursor_select_all_key      = 'g<A-m>'
	let g:multi_cursor_next_key            = '<C-m>'
	let g:multi_cursor_prev_key            = '<C-p>'
	let g:multi_cursor_skip_key            = '<C-x>'
	let g:multi_cursor_quit_key            = '<C-e>'
endif

" tsuquyomi
if dein#tap('tsuquyomi')
  autocmd InsertLeave,TextChanged,BufWritePost *.ts,*.tsx call tsuquyomi#asyncGeterr()
  let g:tsuquyomi_use_vimproc = 0
  let g:tsuquyomi_disable_quickfix = 1
endif

" gruvbox (if not using, comment out)
" let g:gruvbox_italic=0

" pencil (if not using, comment out)
" let g:pencil_terminal_italics = 0


" }}}

" Basic settings {{{

" Neovim/Vim True Color support
" set termguicolors

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

" Accessing the system clipboard
set clipboard=unnamed

" Avoid automatic indentation
autocmd InsertLeave *
      \ if &paste | set nopaste mouse=a | echo 'nopaste' | endif |
      \ if &l:diff | diffupdate | endif

" Switch on highlighting the last used search pattern
set hlsearch

" Search while ignoring case
set ignorecase

" Encode
set encoding=utf-8

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

" let ayucolor="dark"
" Colorscheme
" colorscheme harlequin
" colorscheme spacegray
" colorscheme gotham
" colorscheme joker
" colorscheme falcon
colorscheme brogrammer
" colorscheme znake
" colorscheme iceberg


" gui configuration
highlight Visual term=reverse cterm=reverse guibg=Grey

" }}}

" Check whether plugins should be installed or not
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
