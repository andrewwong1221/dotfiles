" Tabs and Spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
set backspace=indent,eol,start
set expandtab
set autoindent
set smartindent
set smarttab

" Install pathogen
call pathogen#infect()

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Set guifont
if has('gui_running')
    set guifont=ProggyCleanTTSZBP:h16
endif

" Misc
set number
set ruler
set showcmd
set showmatch
set wildmenu
set wildmode=longest,list,full
"set nowrap
set hidden
set modeline
set autoread       " auto-reload modified files (with no local changes)
set nocompatible   " don't try to be compatible with vi
set ignorecase     " ignore case in search
set smartcase      " override ignorecase if uppercase is used in search string
set report=0       " report all changes
set laststatus=2   " always show status-line
set cursorline     " highlight current line
set scrolloff=4
set nofoldenable

" Set Leader Key
:let mapleader = ","

" Easier buffer switching
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :b1<CR>
nnoremap <Leader>2 :b2<CR>
nnoremap <Leader>3 :b3<CR>
nnoremap <Leader>4 :b4<CR>
nnoremap <Leader>5 :b5<CR>
nnoremap <Leader>6 :b6<CR>
nnoremap <Leader>7 :b7<CR>
nnoremap <Leader>8 :b8<CR>
nnoremap <Leader>9 :b9<CR>

" show spaces
nnoremap <f2> :<C-U>setlocal lcs=tab:>-,trail:~,eol:$,extends:>,precedes:< list! list?<CR>


" Theme
set background=dark
colorscheme solarized

" Keep swap files in one of these 
set directory=~/tmp,/var/tmp,/tmp,.

" Let's see some useful info in the status line
set statusline=%F\ B:%-10.3n\ %m%r%w%y\ %=(%L\ loc)\ [#\%03.3b\ 0x\%02.2B]\ \ %l,%v\ \ %P

" Per file-type indentation
autocmd BufEnter *.js  set softtabstop=4|set shiftwidth=4
autocmd BufEnter *.c   set softtabstop=4|set shiftwidth=4

" Better search
set hlsearch
set incsearch

" File-type
filetype on
filetype plugin on
filetype indent on

" Show trailing white-space
let ruby_space_errors = 1
let c_space_errors = 1
let javascript_space_errors = 1

let c_C99 = 1

if exists("c_no_names")
  unlet c_no_names
endif

" Easy command mode switch
inoremap kj <Esc>

" Fix backspace key in xterm
inoremap  <BS>

" inoremap () ()<Left>
" inoremap [] []<Left>
" inoremap '' ''<Left>
" inoremap "" ""<Left>

inoremap <C-l> <C-x><C-l>

inoremap <C-f> function () {}<Left>

" Enable mouse in insert and normal mode
set mouse=vin

" Create an empty line underneath without moving the cursor
" noremap <CR> mlo<Esc>`l

" Indent with spacebar
" noremap <space> >>

" Move easily between ^ and $
noremap <C-h> ^
noremap <C-l> $
noremap j gj
noremap k gk

" Syntax coloring
" if $TERM == "urxvt"
set t_Co=256
" endif
syntax enable
" colors zenburn
" colorscheme zenburn

" Minimum window height = 0
set wmh=0

" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim

" function! CleverTab()
"       return "\<Tab>"
"    else
"       return "\<C-N>"
" endfunction
" inoremap <Tab> <C-R>=CleverTab()<CR>

"
" Tabline
"
" if exists("+showtabline") function! MyTabLine() let s = ''
"     let t = tabpagenr()
"     let i = 1
" 
"     while i <= tabpagenr('$')
"       let buflist = tabpagebuflist(i)
"       let winnr = tabpagewinnr(i)
"       let s .= '%' . i . 'T'
"       let s .= (i == t ? '%1*' : '%2*')
"       let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
"       let file = bufname(buflist[winnr - 1])
"       let file = fnamemodify(file, ':p:t')
"       let file = (file == '') ? '[No Name]' : file
"       let s .= ' ' . file . ' '
"       let s .= winnr
"       let s .= (getbufvar(buflist[winnr - 1], '&modified') ? '+ ' : ' ')
"       let i = i + 1
"     endwhile
"     let s .= '%T%#TabLineFill#%='
"     let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
"     return s
"   endfunction
"   set stal=2
"   set tabline=%!MyTabLine()
" endif
      
" Settings for VimClojure
let vimclojure#HighlightBultins=1      " Highlight Clojure's builtins
let vimclojure#ParenRainbow=1          " Rainbow parentheses'!

" Settings for Slimv
let g:slimv_swank_clojure = '! xterm -e lein swank &' 
