" Author: John Anderson (sontek@gmail.com)
" http://blog.sontek.net/2008/05/11/python-with-a-modular-ide-vim/
" Modified by Lorenzo Bolla

" Don't load plugins if we aren't in Vim7
if version < 700
	set noloadplugins
endif

"" Skip this file unless we have +eval
if 1

""" Settings 
set nocompatible						" Don't be compatible with vi

"""" Movement
" work more logically with wrapped lines
noremap j gj
noremap k gk

"""" Searching and Patterns
"set ignorecase							" search is case insensitive
set smartcase							" search case sensitive if caps on 
set incsearch							" show best match so far
set hlsearch							" Highlight matches to the search 

"""" Display
set background=dark						" I use dark background
set lazyredraw							" Don't repaint when scripts are running
set scrolloff=3							" Keep 3 lines below and above the cursor
set ruler								" line numbers and column the cursor is on
set number								" Show line numbering
set numberwidth=1						" Use 1 col + 1 space for numbers
set mouse=a                             " so mouse do not select numbers
colorscheme tango						" Use colorscheme

" tab labels show the filename without path(tail)
set guitablabel=%N/\ %t\ %M

""" Windows
if exists(":tab")						" Try to move to other windows if changing buf
	set switchbuf=useopen,usetab
else									" Try other windows & tabs if available
	set switchbuf=useopen
endif

"""" Messages, Info, Status
set shortmess+=a						" Use [+] [RO] [w] for modified, read-only, modified
set showcmd								" Display what command is waiting for an operator
set ruler								" Show pos below the win if there's no status line
set laststatus=2						" Always show statusline, even if only 1 window
set report=0							" Notify me whenever any lines have changed
set confirm								" Y-N-C prompt if closing with unsaved changes
set vb t_vb=							" Disable visual bell!  I hate that flashing.
set noautoread							" Disable autoread of files

"""" Editing
set backspace=2							" Backspace over anything! (Super backspace!)
set showmatch							" Briefly jump to the previous matching paren
set matchtime=2							" For .2 seconds
set formatoptions-=t					" I can format for myself, thank you very much
set tabstop=4							" Tab stop of 4
set shiftwidth=4						" sw 4 spaces (used on auto indent)
set softtabstop=4						" 4 spaces as a tab for bs/del

" we don't want to edit these type of files
set wildignore=*.o,*.obj,*.bak,*.exe,*.pyc,*.swp

"""" Coding
set history=100							" 100 Lines of history
set showfulltag							" Show more information while completing tags
filetype plugin on                      " Enable filetype plugins
filetype plugin indent on               " Let filetype plugins indent for me
syntax on                               " Turn on syntax highlighting

" set up tags
" ctags -R -f ~/.vim/tags/python.ctags /usr/lib/python2.5/
set tags=tags;/
set tags+=$HOME/.vim/tags/python.ctags

""""" Folding
"set foldmethod=syntax					" By default, use syntax to determine folds
set foldlevelstart=99					" All folds open by default

"""" Command Line
set wildmenu                            " Autocomplete features in the status bar
set wildmode=longest:full

"""" Autocommands
if has("autocmd")
	augroup vimrcEx
	au!
		" Filetypes
		au BufRead,BufNewFile *.txt,README* set filetype=text

		" In plain-text files and svn commit buffers, wrap automatically at 78 chars
		au FileType text,svn setlocal tw=78 fo+=t

		" In all files, try to jump back to the last spot cursor was in before exiting
		au BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\   exe "normal g`\"" |
			\ endif

		" Use :make to check a script with perl
		au FileType perl set makeprg=perl\ -c\ %\ $* errorformat=%f:%l:%m

		" Use :make to compile c, even without a makefile
		au FileType c,cpp if glob('Makefile') == "" | let &mp="gcc -o %< %" | endif

		" open/close matches for geneity templating system
		" match with %
		au FileType html let b:match_words = 'GT_FOR:GT_ENDFOR,GT_IF:GT_ELSE:GT_ENDIF'

		" Switch to the directory of the current file, unless it's a help file.
		au BufEnter * if &ft != 'help' | silent! cd %:p:h | endif

		" smart indenting for python
		au FileType python set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
		" indent also the comment
		au FileType python set cindent

		" allows us to run :make and get syntax errors for our python scripts
		au FileType python set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
		" setup file type for code snippets
		"au FileType python if &ft !~ 'django' | setlocal filetype=python.django_tempate.django_model | endif
		"au FileType python set expandtab

		" kill calltip window if we move cursor or leave insert mode
		au CursorMovedI * if pumvisible() == 0|pclose|endif
		au InsertLeave * if pumvisible() == 0|pclose|endif

		" sql files
		augroup sqlplus
			au FileType sql set smartindent cinwords=declare,exception,function
			au BufRead,BufNewFile *.tab,*.alt,*.ndx,*.pkc,*.fkc,*.fun,*.prc,*.ukc,*.drp,*.ins,*.upd,*.del,*.sql setfiletype sql
		augroup END

		" file change outside Vim
		au FileChangedShell * call FCSHandler(expand("<afile>:p"))
		function FCSHandler(name)
		   let msg = 'File "'.a:name.'"'
		   let v:fcs_choice = ''
		   if v:fcs_reason == "deleted"
			  let msg .= " no longer available - 'modified' set"
			  call setbufvar(expand(a:name), '&modified', '1')
			  echohl WarningMsg
		   elseif v:fcs_reason == "time"
			  let msg .= " timestamp changed"
		   elseif v:fcs_reason == "mode"
			  let msg .= " permissions changed"
		   elseif v:fcs_reason == "changed"
			  let msg .= " contents changed"
			  let v:fcs_choice = "ask"
		   elseif v:fcs_reason == "conflict"
			  let msg .= " CONFLICT --"
			  let msg .= " is modified, but"
			  let msg .= " was changed outside Vim"
			  let v:fcs_choice = "ask"
			  echohl ErrorMsg
		   else  " unknown values (future Vim versions?)
			  let msg .= " FileChangedShell reason="
			  let msg .= v:fcs_reason
			  let v:fcs_choice = "ask"
			  echohl ErrorMsg
		   endif
		   redraw!
		   echomsg msg
		   echohl None
		endfunction

	augroup END
endif

"""" Key Mappings
" bind ctrl+space for omnicompletion
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
			\ "\<lt>C-n>" :
			\ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
			\ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
			\ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

" Toggle the tag list bar
nmap <F4> :TlistToggle<CR>

" Grep
nmap <F2> :Grep<CR>
nmap <F3> :Rgrep<CR>

" HTML
let g:html_tag_case = 'lowercase'
let g:html_tag_case_autodetect = 'yes'

" tab navigation (next tab) with alt left / alt right
nnoremap  <a-right>  gt
nnoremap  <a-left>   gT

"" Ctrl + Arrows - Move around quickly
"nnoremap  <c-up>     {
"nnoremap  <c-down>   }
"nnoremap  <c-right>  El
"nnoremap  <c-down>   Bh

"" Shift + Arrows - Visually Select text
"nnoremap  <s-up>     Vk
"nnoremap  <s-down>   vj
"nnoremap  <s-right>  vl
"nnoremap  <s-left>   vh

"if &diff
"" easily handle diffing 
"   vnoremap < :diffget<CR>
"   vnoremap > :diffput<CR>
"else
"" visual shifting (builtin-repeat)
"   vnoremap < <gv                       
"   vnoremap > >gv 
"endif

" Extra functionality for some existing commands:
" <C-6> switches back to the alternate file and the correct column in the line.
nnoremap <C-6> <C-6>`"

" CTRL-g shows filename and buffer number, too.
nnoremap <C-g> 2<C-g>

" Arg!  I hate hitting q: instead of :q
nnoremap q: q:iq<esc>

" <C-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Q formats paragraphs, instead of entering ex mode
noremap Q gq

" * and # search for next/previous of selected text when used in visual mode
vnoremap * y/<C-R>"<CR>
vnoremap # y?<C-R>"<CR>

" <space> toggles folds opened and closed
nnoremap <space> za

" <space> in visual mode creates a fold over the marked range
vnoremap <space> zf

" allow arrow keys when code completion window is up
inoremap <Down> <C-R>=pumvisible() ? "\<lt>C-N>" : "\<lt>Down>"<CR>

" Comments
noremap <silent> ,c :call EnhancedCommentify('','comment')<CR>
noremap <silent> ,d :call EnhancedCommentify('','decomment')<CR>
noremap <silent> ,f :call EnhancedCommentify('','first')<CR>
noremap <silent> ,g :call EnhancedCommentify('','guess')<CR>

" OKKIO
noremap ,O OOKKIO <ESC>,cA

" Remove trailing whitespaces
map ,w :%s/[ ^I]*$//g<CR>

""" Abbreviations
function! EatChar(pat)
  let c = nr2char(getchar(0))
  return (c =~ a:pat) ? '' : c
endfunc

iabbr _me Lorenzo Bolla<C-R>=EatChar('\s')<CR>
iabbr _mail Lorenzo Bolla <lbolla@gmail.com><C-R>=EatChar('\s')<CR>
"iabbr _t <C-R>=strftime("%H:%M:%S")<CR><C-R>=EatChar('\s')<CR>
"iabbr _d <C-R>=strftime("%a, %d %b %Y")<CR><C-R>=EatChar('\s')<CR>
iabbr _today <C-R>=strftime("%a, %d %b %Y")<CR><C-R>=EatChar('\s')<CR>
"iabbr _dt <C-R>=strftime("%a, %d %b %Y %H:%M:%S %z")<CR><C-R>=EatChar('\s')<CR>

endif
