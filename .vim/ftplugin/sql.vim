" sql.vim
" by Lorenzo Bolla on Sun, 28 Sep 2008
"
" execute scripts in an sql session

let sql_cmd = 'sqlplus'
let sql_db = ''
let sql_user = ''
let sql_pwd = ''

function! SqlExec()
	let g:sql_user = input("User: ", g:sql_user)
	let g:sql_pwd = g:sql_user
	let g:sql_pwd = input("Pwd: ", g:sql_pwd)
	let g:sql_db = input("DB: ", g:sql_db)
	execute '!' g:sql_cmd . ' ' . g:sql_user . '/' . g:sql_pwd . g:sql_db . ' < "%"'
endfunction

map <F5> :wall<CR>:call SqlExec()<CR>
"unmap <F6>
"unmap <F7>
"unmap <F8>
"unmap <F9>
"unmap <F10>
