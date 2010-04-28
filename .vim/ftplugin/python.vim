setlocal makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
setlocal smartindent cindent cinwords=if,elif,else,for,while,try,except,finally,def,class

nnoremap <buffer> <F5>  :!python %<CR>
nnoremap <buffer> <F8>  :!pychecker --no-local --no-argsused --no-override --no-classattr %<CR>
nnoremap <buffer> <F9>  :!pychecker %<CR>
nnoremap <buffer> <F10> Oimport pdb; pdb.set_trace() # BREAKPOINT<ESC>
nnoremap <buffer> <F11> oimport pdb; pdb.set_trace() # BREAKPOINT<ESC>

let b:match_words='if:elif:else,try:except'
