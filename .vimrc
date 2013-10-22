set nocompatible               " be iMproved

filetype off                   " required by vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'Shougo/vimproc'
Bundle 'flazz/vim-colorschemes'
Bundle 'hrp/EnhancedCommentify'
Bundle 'jnwhiteh/vim-golang'
Bundle 'klen/python-mode'
Bundle 'mileszs/ack.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'scrooloose/syntastic'
Bundle 'ujihisa/neco-ghc'
Bundle 'tpope/vim-abolish'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'kien/ctrlp.vim'
Bundle 'JuliaLang/julia-vim'
if v:version >= 703
    Bundle 'dag/vim2hs'
    if has('patch584') && has('python')
        Bundle 'Valloric/YouCompleteMe'
    endif
endif
if executable('ghc-mod')
    Bundle 'eagletmt/ghcmod-vim'
endif
if &term != 'linux'
	Bundle 'Lokaltog/vim-powerline'
endif

source $VIMRUNTIME/macros/matchit.vim

filetype plugin indent on
syntax on

if $COLORTERM == 'gnome-terminal'
	set t_Co=256
endif

set background=dark
if &term != 'linux'
	colorscheme lorenzo
endif

set backspace=indent,eol,start
set encoding=utf-8
set noexpandtab
set foldlevelstart=99
set hls
set incsearch
set laststatus=2
set mouse=a
set nobackup
set noswapfile
set nowritebackup
set pastetoggle=<F2>
set shiftwidth=4
set softtabstop=4
set tabstop=4
set wildignore=*.o,*.bak,*.pyc,*.swp
set wildmenu
set wildmode=longest:full
set guioptions-=T

let mapleader=","
nnoremap <leader>t :tabnew 
nnoremap <leader>a :Ack "<C-R><C-W>"
nnoremap <leader>l :SyntasticCheck<CR>
nnoremap <leader>x :nohl<CR>

let g:EnhCommentifyUserBindings='yes'
let g:EnhCommentifyRespectIndent = 'Yes'
let g:EnhCommentifyPretty = 'Yes'
vmap <silent> <leader>c <Plug>VisualComment
vmap <silent> <leader>d <Plug>VisualDeComment
vmap <silent> <leader>g <Plug>VisualTraditional
vmap <silent> <leader>f <Plug>VisualFirstLine
vmap <silent> <leader><Space> :s/\ *$//g<CR>
nmap <silent> <leader><Space> :%s/\ *$//g<CR>
nmap <silent> <leader>c <Plug>Comment
nmap <silent> <leader>d <Plug>DeComment
nmap <silent> <leader>g <Plug>Traditional
nmap <silent> <leader>f <Plug>FirstLine

let fortran_free_source=1
let g:haskell_conceal_enumerations=0
let g:hpaste_author = 'Lorenzo Bolla'
let g:pymode_folding=0
let g:pymode_lint_mccabe_complexity=9
let g:pymode_lint_write=1
let g:pymode_motion=1
let g:pymode_rope=0
let g:pymode_utils_whitespaces=0
let g:pymode_virtualenv=0
let g:ycm_key_detailed_diagnostics = '<leader>q'

if executable('ag')
    let g:ackprg = 'ag --nogroup --nocolor --column'
endif

if has("autocmd")
    autocmd BufEnter * if &ft != 'help' | silent! cd %:p:h | endif
    autocmd BufNewFile,BufRead,BufEnter *.md set filetype=markdown
    autocmd BufNewFile,BufRead,BufEnter *.tmpl set filetype=html
    autocmd BufNewFile,BufRead,BufEnter *.go set filetype=go
endif

function EnhCommentifyCallback(ft)
    if a:ft == 'go'
        let b:ECcommentOpen = '// '
    endif
endfunction
let g:EnhCommentifyCallbackExists = 'Yes'
