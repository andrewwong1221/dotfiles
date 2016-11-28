" CXX
setl sts=2|set sw=2|set ts=2|set expandtab

" F9/F10 compile
" compiler rakefds

let b:dispatch = 'rakefds build -release | sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g"'


