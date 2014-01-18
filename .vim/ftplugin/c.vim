" kernel style
" https://www.kernel.org/doc/Documentation/CodingStyle
" set shiftwidth=8
" set softtabstop=8
" set tabstop=8
" set noexpandtab

" k&r style
" http://en.wikipedia.org/wiki/Indent_style#K.26R_style
" similar to $> indent -kr -cli0 -nut
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

setlocal textwidth=79
if exists('+colorcolumn')
    setlocal colorcolumn=80
endif

let g:syntastic_c_checkers = ['ycm', 'splint']
