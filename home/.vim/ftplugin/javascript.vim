" Javascript
setl sts=2|set sw=2|set ts=2|set expandtab
" let g:syntastic_javascript_checkers = ['jshint', 'jscs']
let g:syntastic_javascript_checkers = ['jshint']
set makeprg=grunt
map <F7> :set makeprg=grunt\ sass<CR>:Make<CR>
map <F8> :set makeprg=grunt\ karma:continuous<CR>:Make<CR>
map <F9> :set makeprg=grunt<CR>:Make<CR>

let g:javascript_conceal=1
let javascript_enable_domhtmlcss=1
