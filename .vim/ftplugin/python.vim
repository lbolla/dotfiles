setlocal makeprg=pychecker\ -Q\ %
setlocal smartindent cindent cinwords=if,elif,else,for,while,try,except,finally,def,class

let b:match_words='if:elif:else,try:except'

nnoremap <buffer> <F6>  :!rats .<CR>
nnoremap <buffer> <F7>  :!rats -w 3 .<CR>
nnoremap <buffer> <F8>  :!pychecker --no-local --no-argsused --no-override --no-classattr %<CR>
nnoremap <buffer> <F9>  :!pychecker %<CR>
nnoremap <buffer> <F10> Oimport pdb; pdb.set_trace() # BREAKPOINT<ESC>
nnoremap <buffer> <F11> oimport pdb; pdb.set_trace() # BREAKPOINT<ESC>
