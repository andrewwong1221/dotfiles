" Javascript
setl sts=4|set sw=4|set ts=4|set expandtab
let g:syntastic_javascript_checkers = ['jshint', 'jscs']

if findfile('.jshintrc', '.;') != ''
    let b:syntastic_javascript_jshint_args = '--config ' . getcwd() . '/.jshintrc'
endif

if findfile('.jscsrc', '.;') != ''
    let b:syntastic_javascript_jscs_args = '--config ' . getcwd() . '/.jshintrc'
endif

" let g:syntastic_javascript_checkers = ['jshint']
set makeprg=grunt
map <F7> :set makeprg=grunt\ sass<CR>:Make<CR>
map <F8> :set makeprg=grunt\ karma:continuous<CR>:Make<CR>
map <F9> :set makeprg=grunt<CR>:Make<CR>

let g:javascript_conceal=1
let javascript_enable_domhtmlcss=1
