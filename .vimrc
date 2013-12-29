set nocompatible               " be iMproved

filetype off                   " required by vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'Shougo/vimproc'
Bundle 'flazz/vim-colorschemes'
Bundle 'scrooloose/nerdcommenter'
Bundle 'jnwhiteh/vim-golang'
Bundle 'klen/python-mode'
Bundle 'mileszs/ack.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-unimpaired'
Bundle 'ujihisa/neco-ghc'
Bundle 'tpope/vim-abolish'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'kien/ctrlp.vim'
Bundle 'JuliaLang/julia-vim'
if v:version >= 703
    Bundle 'dag/vim2hs'
    if v:version >= 704 || (has('patch584') && has('python'))
        Bundle 'Valloric/YouCompleteMe'
    endif
endif
if executable('ghc-mod')
    Bundle 'eagletmt/ghcmod-vim'
endif
if &term != 'linux'
	Bundle 'bling/vim-airline'
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
set cursorline
set encoding=utf-8
set foldlevelstart=99
set guioptions-=T
set hls
set path=.,/usr/local/include,/usr/include,,
set incsearch
set laststatus=2
set mouse=a
set nobackup
set noexpandtab
set noswapfile
set nowritebackup
set pastetoggle=<F2>
set shiftwidth=4
set softtabstop=4
set tabstop=4
set wildignore=*.o,*.bak,*.pyc,*.swp
set wildmenu
set wildmode=longest:full

let mapleader=","
nnoremap <leader>t :tabnew<Space>
nnoremap <leader>v :vsp<Space>
nnoremap <leader>a :Ack "<C-R><C-W>"
nnoremap <leader>gg :Ggrep "<C-R><C-W>"
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>l :SyntasticCheck<CR>
nnoremap <leader>x :nohl<CR>

vmap <silent> <leader><Space> :s/\ *$//g<CR>
nmap <silent> <leader><Space> :%s/\ *$//g<CR>

let fortran_free_source=1
let g:html_indent_inctags="html,body,head,tbody"
let g:haskell_conceal_enumerations=0
let g:hpaste_author = 'Lorenzo Bolla'
let g:pymode_folding=0
" let g:pymode_lint_checker="pyflakes,pep8" " pylint, mccabe, pep257
let g:pymode_lint_ignore="R0201,R0914,R0912,C0110,C0302,C0110,C901,C0301,W0511,W0201,W0703,W0603,W0632,E0611,F0401,W0212"
" let g:pymode_lint_mccabe_complexity=8
let g:pymode_lint_write=1
let g:pymode_motion=1
let g:pymode_rope=0
let g:pymode_utils_whitespaces=0
let g:pymode_virtualenv=0
let g:syntastic_javascript_checkers = ['jsl']
let g:ycm_key_detailed_diagnostics = '<leader>q'
let NERDSpaceDelims = 1

" airline
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_right_sep = ''

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
