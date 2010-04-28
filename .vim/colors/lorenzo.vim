" Vim color file

" First remove all existing highlighting.
set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let colors_name = "lorenzo"

hi Search term=reverse ctermfg=0 ctermbg=1 guifg=Black guibg=Green
hi Todo term=reverse ctermfg=15 ctermbg=1 guifg=White guibg=Red 
