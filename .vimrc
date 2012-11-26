set nocompatible               " be iMproved
"filetype off                   " required!
filetype plugin indent on

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

Bundle 'Lokaltog/vim-powerline'
Bundle 'Shougo/vimproc'
Bundle 'dag/vim2hs'
Bundle 'eagletmt/ghcmod-vim'
Bundle 'flazz/vim-colorschemes'
Bundle 'hrp/EnhancedCommentify'
Bundle 'jnwhiteh/vim-golang'
Bundle 'klen/python-mode'
Bundle 'mileszs/ack.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'pentie/VimRepress'
Bundle 'scrooloose/syntastic'
Bundle 'ujihisa/neco-ghc'

syntax on

set background=dark
"colorscheme desert256
colorscheme lorenzo

set nobackup
set noswapfile
set wildmenu
set wildignore=*.o,*.bak,*.pyc,*.swp
set wildmode=longest:full
set incsearch
set hls
set laststatus=2
set encoding=utf-8
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set pastetoggle=<F2>

let mapleader=","
nnoremap <leader>t :tabnew 
nnoremap <leader>a :Ack "<C-R><C-W>"
nnoremap <leader>l :SyntasticCheck<CR>
nnoremap <leader>x :nohl<CR>

let g:EnhCommentifyUserBindings='yes'
vmap <silent> <leader>c <Plug>VisualComment
vmap <silent> <leader>d <Plug>VisualDeComment
vmap <silent> <leader>g <Plug>VisualTraditional
vmap <silent> <leader>f <Plug>VisualFirstLine
nmap <silent> <leader>c <Plug>Comment
nmap <silent> <leader>d <Plug>DeComment
nmap <silent> <leader>g <Plug>Traditional
nmap <silent> <leader>f <Plug>FirstLine

let g:haskell_conceal_enumerations=0
let g:pymode_folding=0
let g:pymode_lint_mccabe_complexity=9
let g:pymode_lint_write=1
let g:pymode_motion=1
let g:pymode_rope=0
let g:pymode_utils_whitespaces=0
let g:pymode_virtualenv=1

if has("autocmd")
	autocmd BufEnter * if &ft != 'help' | silent! cd %:p:h | endif
	autocmd BufNewFile,BufRead,BufEnter *.md set filetype=markdown
	autocmd BufNewFile,BufRead,BufEnter *.tmpl set filetype=html
endif
