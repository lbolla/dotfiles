compiler pylint

nnoremap <buffer> <leader>b  Oimport pdb; pdb.set_trace() # BREAKPOINT<ESC>,d
nnoremap <buffer> <leader>p  :Shell pychecker %<CR><CR>
nnoremap <buffer> <leader>gp :Shell pychecker --no-local --no-argsused --no-override --no-classattr %<CR><CR>
nnoremap <buffer> <leader>l  :Shell pylint --output-format=parseable --reports=no %<CR><CR>
nnoremap <buffer> <leader>gl :Shell pylint --disable-msg-cat=C,R --output-format=parseable --reports=no %<CR><CR>
nnoremap <buffer> <leader>8  :Shell pep8 %<CR><CR>
nnoremap <buffer> <leader>r  :Shell rats .<CR><CR>
nnoremap <buffer> <leader>gr :Shell rats -w 3 .<CR><CR>

" PEP8 from http://svn.python.org/projects/python/trunk/Misc/Vim/vimrc
setlocal tabstop=8
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal expandtab
setlocal textwidth=79
setlocal smartindent cindent cinwords=if,elif,else,for,while,try,except,finally,def,class
setlocal fileformat=unix
" setlocal foldmethod=indent
setlocal formatoptions=tcroql
highlight BadWhitespace ctermbg=red guibg=red
" Display tabs at the beginning of a line in Python mode as bad.
match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
match BadWhitespace /\s\+$/

let b:match_words='if:elif:else,try:except'

highlight SpellBad term=underline gui=undercurl guisp=Orange
