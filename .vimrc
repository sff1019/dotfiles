" vimrc
"
" " Only for nvim
if !has('nvim')
  set ttymouse=xterm2
endif
" Flags {{{
let s:use_dein = 1
" }}}

" Filetype Settings
source ~/.config/nvim/ft.rc.vim


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
let s:dein_toml = '~/.config/nvim/dein.toml'
let s:dein_lazy_toml = '~/.config/nvim/deinlazy.toml'
let s:dein_ft_toml = '~/dev/dotfiles/vim/rc/deinft.toml'
let s:dein_color_toml = '~/dev/dotfiles/vim/rc/deincol.toml'

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
  call dein#load_toml(s:dein_toml, {'lazy': 0})
  call dein#load_toml(s:dein_color_toml, {'lazy': 0})
  call dein#load_toml(s:dein_lazy_toml, {'lazy': 1})
  call dein#load_toml(s:dein_ft_toml)

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif
" }}}

" enable plugin, indent
filetype plugin indent on
" }}}

" gui configuration
highlight Visual term=reverse cterm=reverse guibg=Grey
highlight IndentGuidesOdd  ctermbg=240
highlight IndentGuidesEven ctermbg=238

" Settings
source ~/.config/nvim/settings.rc.vim

" Show highlight group under cursor
source ~/dev/dotfiles/vim/plugins/.vimrc_syntax_info

" }}}

" Check whether plugins should be installed or not
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
