" Tabs and Spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Color Column Settings
" set textwidth=80
" set colorcolumn to be the textwidth +1-3
if exists('+colorcolumn')
  set colorcolumn=80
else
  " au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
  highlight OverLength ctermbg=red ctermfg=white guibg=#592929
  match OverLength /\%81v.\+/
endif
if has('conceal') 
  set conceallevel=2
endif


set backspace=indent,eol,start
" set noexpandtab
set autoindent
set smartindent
set smarttab
set encoding=utf-8



" Bootstrap vundle
set nocompatible
filetype off

if !isdirectory(expand("~/.vim/bundle/Vundle.vim"))
	!mkdir -p ~/.vim/bundle
	!git clone git://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	let s:bootstrap=1 " indicate that we are installing for the first time
endif

" Install pathogen
call pathogen#infect()

" Setup vundle
set runtimepath+=~/.vim/bundle/Vundle.vim/
call vundle#begin()


" Let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" Other plugins
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-pathogen'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-classpath'
Plugin 'tpope/vim-fireplace'
Plugin 'guns/vim-clojure-static'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-scripts/paredit.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'elzr/vim-json'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-dispatch'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mustache/vim-mustache-handlebars'

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-vinegar'

" Local Vimrc (which may have plugins
if filereadable($HOME . "/.vimlocal") 
  source $HOME/.vimlocal
endif


" All plugins must be added before the following line
call vundle#end()         " required
filetype plugin indent on " required

" Install plugins if bootstrapping
if exists("s:bootstrap") && s:bootstrap
	unlet s:bootstrap
	PluginInstall
endif

" Set spelling options
set spell spelllang=en_us



" Dispatch
" nnoremap <F9> :Dispatch!<CR>

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

" Also used for ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

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
let g:netrw_preview      = 0   " No vertical preview
let g:netrw_winsize      = 75  " New netrw window size
let g:netrw_keepdir      = 0   " Change vim's current directory with netrw
let g:netrw_browse_split = 4   " Use the last window to open the file
let g:netrw_altv         = 1   " Split on the right
let g:netrw_banner       = 0   " No Banner
let g:netrw_liststyle    = 3   " Tree style listing
let g:netrw_sort_options = 'i' " Case insensitive sorting
let g:netrw_localrmdir   = "rm -r"


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
" let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1

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

" Syntastic options
let g:syntastic_check_on_open = 1
let g:syntastic_aggregate_errors = 0

let c_C99 = 1

" Disable quickfix spellcheck
autocmd BufReadPost quickfix setlocal nospell


if exists("c_no_names")
  unlet c_no_names
endif

" Easy command mode switch
inoremap kj <Esc>

" Fix backspace key in xterm
" inoremap  <BS> " May be breaking ^ inoremap

" Make <BS><Tab> useful in vim-snipmate
silent! snoremap <unique> <BS> b<BS>


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
        CtrlPMixed
    endif
endfunc

if executable('ag')
    " The Silver Searcher
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif

let gitdir=system("git rev-parse --show-toplevel")
if empty(gitdir)
    " not a git repo
    let gitdir = "."
else
    " remove \r\n
    let gitdir = gitdir[:-2]
endif
 
let pythoncmd = "python -c 'import os.path; print os.path.relpath(\"" . gitdir . "\")'"
let relgitdir = system(pythoncmd)[:-2]

" nnoremap <leader>* :lgrep! "\b<C-R><C-W>\b" . relgitdir . <CR>:lopen<CR>
