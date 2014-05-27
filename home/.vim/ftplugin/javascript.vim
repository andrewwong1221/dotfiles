" Javascript
setl sts=4|set sw=4|set ts=4|set expandtab
let g:syntastic_javascript_checkers = ['jshint']
set makeprg=grunt
map <F9> :set makeprg=grunt<CR>:Make<CR>

let g:javascript_conceal=1
let javascript_enable_domhtmlcss=1
