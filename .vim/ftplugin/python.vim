"" add breakpoints for python 

"python << EOF
"def SetBreakpoint():
"    import re
"    nLine = int( vim.eval( 'line(".")'))

"    strLine = vim.current.line
"    strWhite = re.search( '^(\s*)', strLine).group(1)

"    vim.current.buffer.append(
"       "%(space)spdb.set_trace() %(mark)s Breakpoint %(mark)s" %
"         {'space':strWhite, 'mark': '#' * 30}, nLine - 1)

"    for strLine in vim.current.buffer:
"        if strLine == "import pdb":
"            break
"    else:
"        vim.current.buffer.append( 'import pdb', 0)
"        vim.command( 'normal j1')

"def RemoveBreakpoints():
"    import re

"    nCurrentLine = int( vim.eval( 'line(".")'))

"    nLines = []
"    nLine = 1
"    for strLine in vim.current.buffer:
"        if strLine == 'import pdb' or strLine.lstrip()[:15] == 'pdb.set_trace()':
"            nLines.append( nLine)
"        nLine += 1

"    nLines.reverse()

"    for nLine in nLines:
"        vim.command( 'normal %dG' % nLine)
"        vim.command( 'normal dd')
"        if nLine < nCurrentLine:
"            nCurrentLine -= 1

"    vim.command( 'normal %dG' % nCurrentLine)

"EOF

"" add python libs to vim path
"python << EOF
"import os
"import sys
"import vim
"for p in sys.path:
"    if os.path.isdir(p):
"        vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
"EOF

" evaluate selected text via python
python << EOL
import vim
def EvaluateCurrentRange():
    eval(compile('\n'.join(vim.current.range),'','exec'),globals())
EOL

map <C-h> :py EvaluateCurrentRange()<CR>
map <F5> :wall<CR>:!python "%"<CR>
map <F6> :wall<CR>:!python -i "%"<CR>
map <F7> :wall<CR>:!python -m pdb "%"<CR>
map <F8> :wall<CR>:!pychecker "%"<CR>
map <F9> :wall<CR>:!pydoc ./"%"<CR>
map <F10> Oimport pdb; pdb.set_trace() # BREAKPOINT<ESC>
map ,a $A # 
map ,v :!show_call_graph "%"<CR>

