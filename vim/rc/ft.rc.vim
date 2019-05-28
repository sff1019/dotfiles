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
