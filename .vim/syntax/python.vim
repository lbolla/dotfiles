syn match pythonError "^\s*def\s\+\w\+(.*)\s*$" display
syn match pythonError "^\s*class\s\+\w\+(.*)\s*$" display
syn match pythonError "^\s*for\s.*[^:]$" display
syn match pythonError "^\s*except\s*$" display
syn match pythonError "^\s*finally\s*$" display
syn match pythonError "^\s*try\s*$" display
syn match pythonError "^\s*else\s*$" display
syn match pythonError "^\s*else\s*[^:].*" display
syn match pythonError "^\s*if\s.*[^\:]$" display
syn match pythonError "^\s*except\s.*[^\:]$" display
syn match pythonError "[;]$" display
syn keyword pythonError         do 
syn keyword pythonTodo			OKKIO Breakpoint BREAKPOINT
syn keyword Type				type None file set frozenset bool int long float complex str list tuple dict
syn keyword Type				slice Ellipsis xrange
syn keyword Type				BaseException SystemExit KeyboardInterrupt Exception GeneratorExit StopIteration StandardError ArithmeticError FloatingPointError OverflowError ZeroDivisionError AssertionError AttributeError EnvironmentError IOError OSError WindowsError VMSError EOFError ImportError LookupError IndexError KeyError MemoryError NameError UnboundLocalError ReferenceError RuntimeError NotImplementedError SyntaxError IndentationError TabError SystemError TypeError ValueError UnicodeError UnicodeDecodeError UnicodeEncodeError UnicodeTranslateError Warning DeprecationWarning PendingDeprecationWarning RuntimeWarning SyntaxWarning UserWarning FutureWarning ImportWarning UnicodeWarning
syn keyword Type				True False
