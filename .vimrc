"
" Settings
"

set nocompatible                                  " This must be first, because it changes other options as a side effect.
set backspace=indent,eol,start                    " allow backspacing over everything in insert mode
set nobackup                                      " do not keep a backup file, there are better methods
set noswapfile                                    " do not keep a backup file, there are better methods
set history=50                                    " keep 50 lines of command line history
set ruler                                         " show the cursor position all the time
set showcmd                                       " display incomplete commands
set incsearch                                     " do incremental searching
set scrolloff=0                                   " number of lines below and above the cursor
set statusline=%<%F\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set laststatus=2                                  " always show status line
set report=0                                      " notify if any line changed
set confirm                                       " Y-N-C prompt if closing with unsaved changes
set noautoread                                    " disable autoread
set vb t_vb=                                      " disable visual bell
set wildignore=*.o,*.bak,*.pyc,*.swp
set wildmenu                                      " autocomplete in menubar
set wildmode=longest:full
set grepprg=ack\ -a
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set tags+=$proj_name/tags

" if has('mouse')
"   set mouse=a
" endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

let python_highlight_all=1

"
" Mappings
"

map Q gq
set pastetoggle=<F2>

nnoremap <C-h> gT
nnoremap <C-l> gt
nnoremap <C-j> <C-w>h
nnoremap <C-k> <C-w>l
nnoremap <C-G> 2<C-G>

" nnoremap <F3>  :vimgrep /<C-R><C-W>/ *
" nnoremap <F4>  :grep -r "<C-R><C-W>" .
nnoremap <F4>  :make<CR>

nnoremap <space> za
vnoremap <space> zf

let mapleader = ","

nnoremap          <leader>a  :Ack "<C-R><C-W>"
nnoremap          <leader>gb :Shell git blame %<CR><CR>
nnoremap          <leader>B  :!git gui blame % &<CR><CR>
nnoremap <silent> <leader>l  :set invlist<CR>
nnoremap <silent> <leader>m  :make<CR>
nnoremap          <leader>s  :vsp 
nnoremap          <leader>t  :tabnew 
nnoremap <silent> <leader>w  :%s/\s\+$//<CR>
nnoremap <silent> <leader>x  :nohl<CR>
nnoremap <silent> <leader>q  :!pbcopy<%<CR><CR>

vmap     <silent> <leader>c <Plug>VisualComment
vmap     <silent> <leader>d <Plug>VisualDeComment
vmap     <silent> <leader>g <Plug>VisualTraditional
vmap     <silent> <leader>f <Plug>VisualFirstLine

nmap     <silent> <leader>c <Plug>Comment
nmap     <silent> <leader>d <Plug>DeComment
nmap     <silent> <leader>g <Plug>Traditional
nmap     <silent> <leader>f <Plug>FirstLine

"
" Plugins
"

runtime macros/matchit.vim
let python_highlight_space_errors=0
let g:EnhCommentifyPretty='Yes'
let g:EnhCommentifyRespectIndent='Yes'
let g:EnhCommentifyUserBindings="Yes"
let g:EnhCommentifyUseBlockIndent='Yes'
let Tlist_WinWidth = 50
let g:netrw_altv = 1


"
" Colors
"

set background=dark
" set background=light

colorscheme lorenzo
" colorscheme wombat
" let g:solarized_termcolors=16
" let g:solarized_contrast="high"
" colorscheme solarized


"
" Autocmds
"

if has("autocmd")

  " Enable file type detection.
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
	  " autocmd FileType text setlocal textwidth=78
	  autocmd BufRead,BufNewFile *.txt,README*,diary,TODO set filetype=text
	  autocmd FileType mail setlocal formatoptions-=c
  augroup END

  augroup MAIL
	  au!
	  autocmd FileType mail setlocal spell spelllang=en_gb
	  autocmd FileType mail setlocal formatoptions-=o
  augroup END

  augroup HTML
	  au!
      " match Geneity templates keywords
	  autocmd FileType html let b:match_words='##GT_FOR:##GT_ENDFOR##,##GT_IF:##GT_ELIF:##GT_ELSE##:##GT_ENDIF##,##GT_BLOCK:##GT_ENDBLOCK##'
  augroup END

  augroup SQL
	  au!
	  autocmd FileType sql let b:match_words='IF:THEN:ELSE:END,BEGIN:EXCEPTION:END'
  augroup END

  augroup SH
	  au!
	  autocmd BufRead,BufNewFile *.xinitrc set filetype=sh
  augroup END

  augroup LISP
	  au!
	  autocmd BufRead,BufNewFile *.sbcl,*.sbcl_compile,*.sbcl_run set filetype=lisp
  augroup END

  augroup JS
	  au!
	  autocmd BufRead,BufNewFile *.jsm set filetype=javascript
  augroup END

  augroup PIG
	  au BufNewFile,BufRead *.pig set filetype=pig syntax=pig 
  augroup END 

  " " Switch to the directory of the current file, unless it's a help file.
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


"
" Functions
"


command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)
function! s:RunShellCommand(cmdline)
  echo a:cmdline
  let expanded_cmdline = a:cmdline
  for part in split(a:cmdline, ' ')
     if part[0] =~ '\v[%#<]'
        let expanded_part = fnameescape(expand(part))
        let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     endif
  endfor
  botright new
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  " call setline(1, 'You entered:    ' . a:cmdline)
  " call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  " call setline(3,substitute(getline(2),'.','=','g'))
  execute '$read !'. expanded_cmdline
  setlocal nomodifiable
  1
endfunction
