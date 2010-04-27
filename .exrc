" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup          " do not keep a backup file, use versions instead
else
  set backup            " keep a backup file
endif
set history=50          " keep 50 lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching
set scrolloff=3         " 3 lines below and above the cursor
set statusline=%<%F\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set laststatus=2        " always show status line
set report=0            " notify if any line changed
set confirm             " Y-N-C prompt if closing with unsaved changes
set noautoread          " disable autoread
set vb t_vb=            " disable visual bell
set formatoptions=tcroql
set tabstop=4
set shiftwidth=4
set softtabstop=0       " don't masquerade spaces as tabs
set wildignore=*.o,*.bak,*.pyc,*.swp
set wildmenu            " autocomplete in menubar
set wildmode=longest:full

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

let python_highlight_all=1

" colors
"colorscheme lorenzo

" std plugins
runtime macros/matchit.vim

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

function! CleverTab()
   if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
	  return "\<Tab>"
   else
	  return "\<C-N>"
endfunction
" inoremap <Tab> <C-R>=CleverTab()<CR>

" tab navigation (next tab) with alt left / alt right
nnoremap <A-Left> gT
nnoremap <A-Right> gt
nnoremap <C-G> 2<C-G>
nnoremap <silent> <C-L> :nohl<CR><C-L>
" <space> toggles folds opened and closed
nnoremap <space> za
" grep the word under cursor
nnoremap <F3> :vimgrep /<C-R><C-W>/ *
nnoremap <F4> :grep -r "<C-R><C-W>" .
" insert man page for word under cursor in current buffer
nnoremap ,m :r !man <C-R><C-A><CR>
" or in a new page
nnoremap ,M viWy:new<CR>p:r !man <C-R><C-A><CR>
" remove trailing whitespaces
nmap <silent> ,w :%s/\s\+$//<CR>

" tags
set tags+=$PROJDIR/tags
let Tlist_WinWidth = 50
map ,t :!(cd %:p:h;ctags *)&<CR>
map <F12> :TlistToggle<cr>

" git

" Comments
let g:EnhCommentifyPretty='Yes'
let g:EnhCommentifyRespectIndent='Yes'
let g:EnhCommentifyUserBindings="Yes"
let g:EnhCommentifyUseBlockIndent='Yes'

vmap <silent> ,c <Plug>VisualComment
vmap <silent> ,d <Plug>VisualDeComment
vmap <silent> ,g <Plug>VisualTraditional
vmap <silent> ,f <Plug>VisualFirstLine
nmap <silent> ,c <Plug>Comment
nmap <silent> ,d <Plug>DeComment
nmap <silent> ,g <Plug>Traditional
nmap <silent> ,f <Plug>FirstLine

" <space> in visual mode creates a fold over the marked range
vnoremap <space> zf

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " A minimal syntax based autocomplete func
  if exists("+omnifunc")
    autocmd Filetype *
    \	if &omnifunc == "" |
    \		setlocal omnifunc=syntaxcomplete#Complete |
    \	endif
  endif

  augroup TEXT
	  au!
	  autocmd FileType text setlocal textwidth=78
	  autocmd BufRead,BufNewFile *.txt,README* set filetype=text
  augroup END

  augroup MAIL
	  au!
	  autocmd FileType mail setlocal spell spelllang=en_gb
	  autocmd FileType mail setlocal formatoptions-=o
  augroup END

  " For html files, match Geneity templates keywords
  augroup HTML
	  au!
	  autocmd FileType html let b:match_words='##GT_FOR:##GT_ENDFOR##,##GT_IF:##GT_ELIF:##GT_ELSE##:##GT_ENDIF##,##GT_BLOCK:##GT_ENDBLOCK##'
  augroup END

  augroup SQL
	  au!
	  autocmd FileType sql let b:match_words='IF:THEN:ELSE:END,BEGIN:EXCEPTION:END'
  augroup END

  " Switch to the directory of the current file, unless it's a help file.
  autocmd BufEnter * if &ft != 'help' | silent! cd %:p:h | endif

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent        " always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis 
			  \ | wincmd p | diffthis
endif
