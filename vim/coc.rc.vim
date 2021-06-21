let g:coc_global_extensions = [
      \ 'coc-json',
      \ 'coc-pyright',
      \ 'coc-toml',
      \ 'coc-yaml',
      \ 'coc-vimlsp',
      \ 'coc-gitignore',
      \ 'coc-yank',
      \ 'coc-prettier',
      \ 'coc-git'
      \]

let g:coc_status_error_sign = '•'
let g:coc_status_warning_sign = '•'

" " Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" #649: Some LSPs have issues with backup files
set nobackup
