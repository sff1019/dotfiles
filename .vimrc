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
source ~/dev/dotfiles/vim_modules/.vimrc_dein

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
