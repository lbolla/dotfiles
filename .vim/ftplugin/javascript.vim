compiler jsl

nnoremap <buffer> <leader>l  :Shell jslint --nojsdoc %<CR><CR>
nnoremap <buffer> <leader>l  :Shell jslint --nojsdoc %<CR><CR>
" nnoremap <buffer> <leader>gc :Shell jscompile --compilation_level SIMPLE_OPTIMIZATIONS --js %<CR><CR>
nnoremap <buffer> <leader>gc :Shell jscompile --compilation_level ADVANCED_OPTIMIZATIONS --js %<CR><CR>
nnoremap <buffer> <leader>gl :Shell gjslint %<CR><CR>

setlocal tabstop=8
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal expandtab
setlocal textwidth=79

