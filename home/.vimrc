" Tabs and Spaces
" set tabstop=4
" set shiftwidth=4
" set softtabstop=4

" FDS settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Color Column Settings
" set textwidth=80
" set colorcolumn to be the textwidth +1-3
if has("colorcolumn")
  set colorcolumn=+1,+2,+3
endif

set backspace=indent,eol,start
" set noexpandtab
set autoindent
set smartindent
set smarttab
set encoding=utf-8

" Bootstrap vundle
if !isdirectory(expand("~/.vim/bundle/vundle"))
	!mkdir -p ~/.vim/bundle
	!git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
	let s:bootstrap=1 " indicate that we are installing for the first time
endif


set nocompatible
filetype off


" Setup vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Install pathogen
call pathogen#infect()

" Let Vundle manage Vundle
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-pathogen'
Bundle 'tpope/vim-fugitive'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-classpath'
Bundle 'tpope/vim-fireplace'
Bundle 'guns/vim-clojure-static'
Bundle 'airblade/vim-gitgutter'
Bundle 'vim-scripts/paredit.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'bling/vim-airline'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-dispatch'
Bundle 'kchmck/vim-coffee-script'

" Install bundles if bootstrapping
if exists("s:bootstrap") && s:bootstrap
	unlet s:bootstrap
	BundleInstall
endif

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Set guifont
if has('gui_running')
    " set guifont=ProggyCleanTTSZBP:h16
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

" NetRW
" let g:netrw_preview = 1     " Vertical preview
let g:netrw_browse_split = 4  " Use the last window to open the file
let g:netrw_altv = 1          " Split on the right

" Set Leader Key
let mapleader = ","

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

" Better write
" nmap <CR> :write<CR>
" cabbrev w nope


" Easier window switching
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k

" show spaces with F2
nnoremap <f2> :<C-U>setlocal lcs=tab:>-,trail:~,eol:$,extends:>,precedes:< list! list?<CR>


" Theme
set t_Co=256
let g:solarized_termcolors=16
colorscheme solarized
set background=dark

" Airline
let g:airline_powerline_fonts = 1

" Powerline
" let g:Powerline_symbols = 'fancy'
" let g:Powerline_colorscheme='solarized16'

" Keep swap files in one of these 
set directory=~/tmp,/var/tmp,/tmp,.

" Let's see some useful info in the status line
set statusline=%F\ B:%-10.3n\ %m%r%w%y\ %=(%L\ loc)\ [#\%03.3b\ 0x\%02.2B]\ \ %l,%v\ \ %P


" Better search
set hlsearch
set incsearch

" File-type
filetype on
filetype plugin on
filetype indent on
au CursorHold * checktime

" Show trailing white-space
let ruby_space_errors = 1
let c_space_errors = 1
let javascript_space_errors = 1
let g:syntastic_check_on_open = 1

let c_C99 = 1

if exists("c_no_names")
  unlet c_no_names
endif

" Easy command mode switch
inoremap kj <Esc>

" Fix backspace key in xterm
" inoremap  <BS> " May be breaking ^ inoremap


inoremap <C-l> <C-x><C-l>

inoremap <C-f> function () {}<Left>

" Enable mouse in insert and normal mode
set mouse=a

" Path modification
set path+=**

" Create an empty line underneath without moving the cursor
" This breaks quickfix
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
" endif
syntax enable

" Minimum window height = 0
set wmh=0

" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_cmd = 'call CallCtrlP()'

func! CallCtrlP()
    if exists('s:called_ctrlp')
        CtrlPLastMode
    else
        let s:called_ctrlp = 1
        CtrlP
    endif
endfunc

" Local Vimrc
if filereadable(".vimlocal") 
  source .vimlocal
endif
