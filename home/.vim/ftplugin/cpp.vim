" CXX
setl sts=2|set sw=2|set ts=2|set expandtab

" Mappings
inoremap pl<Tab> System.out.println();<C-o>1h
inoremap p<Tab> System.out.print();<C-o>1h
inoremap cl<Tab> cout <<  << endl;<C-o>8h
inoremap c<Tab> cout << ;<C-o>i

" F9/F10 compile

" normal, visual and select and operator pending mode
map <F9> :set makeprg=rakefds\ -release<CR>:make!<CR>
map <F10> :set makeprg=rakefds\ -debug<CR>:make!<CR>

setl makeprg=rakefds\ -release

