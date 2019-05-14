" vimrc
"
" " Only for nvim
if !has('nvim')
  set ttymouse=xterm2
endif
" Flags {{{
let s:use_dein = 1
" }}}

"""""""""""""""""""""""""""""""""""""""
" Filetype Settings
"""""""""""""""""""""""""""""""""""""""
source ~/dev/dotfiles/vim_modules/.vimrc_filetype

"""""""""""""""""""""""""""""""""""""""
" Dein settings
"""""""""""""""""""""""""""""""""""""""
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
  call dein#add('prabirshrestha/async.vim')
  call dein#add('prabirshrestha/vim-lsp')
  call dein#add('lighttiger2505/deoplete-vim-lsp')
  call dein#add('Shougo/echodoc.vim')
  call dein#add('jiangmiao/auto-pairs')

  " Linter
  call dein#add('w0rp/ale')
  call dein#add('Quramy/tsuquyomi', {'rev': 'db073bb'})
  call dein#add('posva/vim-vue')

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
  call dein#add('octol/vim-cpp-enhanced-highlight')
  call dein#add('chr4/nginx.vim')

  " Statusline
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')

  " Filer
  call dein#add('sh8/defx-icons', {'rev': 'AvailableXterm256'})
  call dein#add('kristijanhusak/defx-git')
  call dein#add('Shougo/defx.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

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

  " Xterm Color
  call dein#add('guns/xterm-color-table.vim')

  " Colorscheme
  call dein#add('nielsmadan/harlequin')
  call dein#add('ajh17/Spacegray.vim')
  call dein#add('whatyouhide/vim-gotham')
  call dein#add('fenetikm/falcon')
  call dein#add('sff1019/vim-brogrammer-theme')
  call dein#add('sff1019/vim-joker')
  call dein#add('sjl/badwolf')
  call dein#add('jdsimcoe/panic.vim')

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

  call dein#add('ryanoasis/vim-devicons')

  " Markdown preview
  call dein#add('iamcco/markdown-preview.vim')

  call dein#end()
endif
" }}}


" ale
if dein#tap('ale')
  let g:ale_swift_swiftlint_executable = 'swiftlint'
  let g:ale_swift_swiftlint_options = ''
  let g:syntastic_python_checker_args='--ignore=E501'

  let g:ale_linters = {
        \   'javascript': ['eslint'],
        \   'go': ['gofmt'],
        \   'python': ['flake8'],
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

" vim-lsp
if dein#tap('vim-lsp')
  let g:lsp_log_verbose = 1
  let g:lsp_log_file = expand('~/vim-lsp.log')

  if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ 'workspace_config': {'pyls': {'plugins': {
        \   'pycodestyle': {'enabled': v:false},
        \   'jedi_definition': {'follow_imports': v:true, 'follow_builtin_imports': v:true},}}}
        \ })
  endif

  if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'typescript-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
        \ 'whitelist': ['typescript'],
        \ })
  endif

  if executable('cquery')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'cquery',
        \ 'cmd': {server_info->['cquery']},
        \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
        \ 'initialization_options': { 'cacheDirectory': '/tmp/cquery/cache' },
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
        \ })
  endif

  if executable('go-langserver')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'go-langserver',
        \ 'cmd': {server_info->['go-langserver', '-gocodecompletion']},
        \ 'whitelist': ['go'],
        \ })
  endif

  " autocmd FileType go setlocal omnifunc=lsp#complete
  autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
  let g:lsp_diagnostics_enabled = 0
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
  let g:airline#extensions#tabline#formatter = 'default'
  set laststatus=2
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#fnamemod = ':t'
  let g:airline#extensions#tabline#left_sep = '  '
  let g:airline#extensions#tabline#left_alt_sep = ' '
  let g:airline_left_sep = ' '
  let g:airline_right_sep = ' '
endif

" vim-coffee-script
if dein#tap('vim-coffee-script')
  autocmd QuickFixCmdPost * nested cwindow | redraw!
  nnoremap <silent> <C-C> :CoffeeCompile vert <CR><C-w>h
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
        \   '-shell-escape',
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

" tsuquyomi
if dein#tap('tsuquyomi')
  autocmd InsertLeave,TextChanged,BufWritePost *.ts,*.tsx call tsuquyomi#asyncGeterr()
  let g:tsuquyomi_use_vimproc = 0
  let g:tsuquyomi_disable_quickfix = 1
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" defx - filer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if dein#tap('defx.nvim')
  autocmd FileType defx call s:defx_my_settings()
  function! s:defx_my_settings() abort
    " Define mappings
    nnoremap <silent><buffer><expr> o
          \ defx#is_directory() ?
          \ defx#do_action('open_tree') :
          \ defx#do_action('multi', ['drop', 'quit'])
    nnoremap <silent><buffer><expr> l
          \ defx#is_directory() ?
          \ defx#do_action('open_tree') :
          \ defx#do_action('multi', ['drop', 'quit'])
    nnoremap <silent><buffer><expr> h
          \ defx#do_action('close_tree')
    nnoremap <silent><buffer><expr> c
          \ defx#do_action('copy')
    nnoremap <silent><buffer><expr> C
          \ defx#do_action('open')
    nnoremap <silent><buffer><expr> m
          \ defx#do_action('move')
    nnoremap <silent><buffer><expr> p
          \ defx#do_action('paste')
    nnoremap <silent><buffer><expr> K
          \ defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> N
          \ defx#do_action('new_file')
    nnoremap <silent><buffer><expr> d
          \ defx#do_action('remove')
    nnoremap <silent><buffer><expr> r
          \ defx#do_action('rename')
    nnoremap <silent><buffer><expr> x
          \ defx#do_action('execute_system')
    nnoremap <silent><buffer><expr> yy
          \ defx#do_action('yank_path')
    nnoremap <silent><buffer><expr> .
          \ defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> ~
          \ defx#do_action('cd')
    nnoremap <silent><buffer><expr> <Space>
          \ defx#do_action('toggle_select') . 'j'
    nnoremap <silent><buffer><expr> *
          \ defx#do_action('toggle_select_all')
    nnoremap <silent><buffer><expr> j
          \ line('.') == line('$') ? 'gg' : 'j'
    nnoremap <silent><buffer><expr> k
          \ line('.') == 1 ? 'G' : 'k'
    nnoremap <silent><buffer><expr> <C-l>
          \ defx#do_action('redraw')
    nnoremap <silent><buffer><expr> <C-g>
          \ defx#do_action('print')
    nnoremap <silent><buffer><expr> cd
          \ defx#do_action('change_vim_cwd')
  endfunction

  call defx#custom#option('_', {
        \ 'columns': 'mark:indent:icons:filename:type',
        \ })

  " It's weird...
  " autocmd VimEnter * call timer_start(0, { tid -> execute('Defx -split=vertical -winwidth=30 -direction=topleft')})
  map <silent> <C-\> :Defx -toggle -split=vertical -winwidth=30 -direction=topleft -resume<CR>
endif

" Plugin settings {{{

" accelerated-jk
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

" enable plugin, indent
filetype plugin indent on
" }}}

" Basic settings {{{
source ~/dev/dotfiles/vim_modules/.vimrc_basic_settings

" gui configuration
highlight Visual term=reverse cterm=reverse guibg=Grey
highlight IndentGuidesOdd  ctermbg=240
highlight IndentGuidesEven ctermbg=238

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show highlight group under cursor
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/dev/dotfiles/vim_modules/.vimrc_syntax_info

" }}}

" Check whether plugins should be installed or not
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
