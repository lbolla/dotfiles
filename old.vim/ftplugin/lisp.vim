set lisp

" indent properly
nnoremap <buffer> <Tab> ==
vnoremap <buffer> <Tab> =

nnoremap <buffer> <F5> :!sbcl --script %<CR>
nnoremap <buffer> <F6> :!sbcl --noinform --eval '(compile-file "%")' --eval '(quit)'<CR>
