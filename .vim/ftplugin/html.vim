setlocal tabstop=8
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal expandtab

nnoremap <buffer> <leader>ij O<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script><ESC>

map <F5> :wall<CR>:!w3m "%"<CR>

" let b:match_words='{%\s*\<for\>.*%}:{%\s*\<end\>\s*%},'
"                         \ . '{%\s*\<if\>.*%}:{%\s*\<elif\>.*%}:{%\s*\<else\>\s*%}:{%\s*\<end\>\s*%},'
"                         \ . '{%\s*\<block\>.*%}:{%\s*\<end\>\s*%}'
" let b:match_words='<:>,'
"                         \ . '<\@<=[ou]l\>[^>]*\%(>\|$\):<\@<=li\>:<\@<=/[ou]l>,'
"                         \ . '<\@<=dl\>[^>]*\%(>\|$\):<\@<=d[td]\>:<\@<=/dl>,'
"                         \ . '<\@<=\([^/][^ \t>]*\)[^>]*\%(>\|$\):<\@<=/\1>,'
"                         \ . '{% *if \{-}%}:{% *elif \{-}%}:{% *else \{-}%}:{% *end \{-}%},'
"                         " \ . '{% *for .*%}:{% *end *%}'
