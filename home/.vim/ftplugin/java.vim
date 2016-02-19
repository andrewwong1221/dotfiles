" JAVA
setl sts=4|set sw=4|set ts=4|set noexpandtab

" Mappings
inoremap pl<Tab> System.out.println();<C-o>1h
inoremap p<Tab> System.out.print();<C-o>1h

" F9/F10 compile/run default file.
" F11/F12 compile/run alternate file.

" normal, visual and select and operator pending mode
" map <F9> :set makeprg=javac\ %<CR>:make<CR>
" map <F10> :!echo %\|awk -F. '{print $1}'\|xargs java<CR>
" map <F11> :set makeprg=javac\ #<CR>:make<CR>
" map <F12> :!echo #\|awk -F. '{print $1}'\|xargs java<CR>
" " command and insert mode
" map! <F9> <Esc>:set makeprg=javac\ %<CR>:make<CR>
" map! <F10> <Esc>:!echo %\|awk -F. '{print $1}'\|xargs java<CR>
" map! <F11> <Esc>set makeprg=javac\ #<CR>:make<CR>
" map! <F12> <Esc>!echo #\|awk -F. '{print $1}'\|xargs java<CR>

" Tip: load a file into the default buffer, and its driver
" into the alternate buffer, then use F9/F12 to build/run.
" Note: # (alternate filename) isn't set until you :next to it!
" Tip2: You can make then run without hitting ENTER to continue. F9-F12

" With these you can cl/cn/cp (quickfix commands) to browse the errors
" after you compile it with :make

setl makeprg=javac\ %
setl errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#

let b:dispatch="javac %"

set path=**
" If two files are loaded, switch to the alternate file, then back.
" That sets # (the alternate file).
if argc() == 2
  n
  e #
endif
