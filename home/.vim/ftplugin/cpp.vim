" CXX
setl sts=2|set sw=2|set ts=2|set expandtab

" F9/F10 compile

set makeprg=rakefds\ -release
" normal, visual and select and operator pending mode
map <F9> :set makeprg=rakefds\ -release<CR>:Make<CR>
map <F10> :set makeprg=rakefds\ -debug<CR>:Make<CR>

