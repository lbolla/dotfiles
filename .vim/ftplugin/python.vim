setlocal makeprg=pylint\ --disable-msg-cat=C,R\ --output-format=parseable\ --reports=no\ %
" setlocal makeprg=pychecker\ -Q\ %

setlocal smartindent cindent cinwords=if,elif,else,for,while,try,except,finally,def,class

let b:match_words='if:elif:else,try:except'

nnoremap <buffer> <F5>  :Shell pylint %<CR><CR>
nnoremap <buffer> <F6>  :Shell rats .<CR><CR>
nnoremap <buffer> <F7>  :Shell rats -w 3 .<CR><CR>
nnoremap <buffer> <F8>  :Shell pychecker --no-local --no-argsused --no-override --no-classattr %<CR><CR>
nnoremap <buffer> <F9>  :Shell pychecker %<CR><CR>
nnoremap <buffer> <F10> Oimport pdb; pdb.set_trace() # BREAKPOINT<ESC>,d
nnoremap <buffer> <F11> oimport pdb; pdb.set_trace() # BREAKPOINT<ESC>,d
