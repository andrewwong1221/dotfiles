set encoding=utf-8

if exists('+colorcolumn')
  " set colorcolumn=80
else
  highlight OverLength ctermbg=red ctermfg=white guibg=#592929
  match OverLength /\%81v.\+/
endif

if has('conceal')
  set conceallevel=2
endif

let g:compiler_gcc_ignore_unmatched_lines=1

" Tabs and Spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set cino+=(0
set autoindent
set smartindent
set smarttab
set backspace=indent,eol,start


" Bootstrap vundle
set nocompatible
filetype off

if !isdirectory(expand("~/.vim/bundle/neobundle.vim"))
	!mkdir -p ~/.vim/bundle
	!git clone git://github.com/Shougo/neobundle.vim.git ~/.vim/bundle/neobundle.vim
	let s:bootstrap=1 " indicate that we are installing for the first time
endif

" Jump to last position in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" Setup neobundle
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  set runtimepath+=~/.vim/bundle/vim-pathogen/
endif
" Install pathogen
call pathogen#infect()

call neobundle#begin(expand('~/.vim/bundle'))


" Let neobundle manage neobundle
NeoBundleFetch 'Shougo/neobundle.vim'

" vimproc
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

" Other plugins
NeoBundle 'tpope/vim-sensible'
NeoBundle 'tpope/vim-pathogen'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-classpath'
NeoBundle 'tpope/vim-fireplace'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-vinegar'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-scriptease'
NeoBundle 'tpope/vim-unimpaired'

NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'guns/vim-clojure-static'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'vim-scripts/paredit.vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'elzr/vim-json'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundle 'bronson/vim-trailing-whitespace'

NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'garbas/vim-snipmate'
NeoBundle 'honza/vim-snippets'
NeoBundle 'mattn/emmet-vim'

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimshell.vim'

NeoBundle 'fatih/vim-go'
NeoBundle 'myusuf3/numbers.vim'
NeoBundle 'godlygeek/tabular'
" NeoBundle 'majutsushi/tagbar'

NeoBundle 'sotte/presenting.vim'
NeoBundle 'unblevable/quick-scope'
NeoBundle 'junegunn/fzf', {'dir': '~/.fzf', 'do': 'yes \| ./install'}
NeoBundle 'junegunn/fzf.vim'
NeoBundle 'sukima/xmledit'
NeoBundle 'xolox/vim-misc'
" NeoBundle 'xolox/vim-easytags'

" NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'google/vim-searchindex'
NeoBundle 'takac/vim-hardtime'

NeoBundle 'mbbill/undotree'


" Local Vimrc (which may have plugins
if filereadable($HOME . "/.vimlocal")
  source $HOME/.vimlocal
endif


" All plugins must be added before the following line
call neobundle#end()         " required
filetype plugin indent on " required

NeoBundleCheck

" Set spelling options
set spell spelllang=en_us

" Disable Ex mode
map Q <Nop>

" Paste settings
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
nnoremap <silent> yo :set paste<cr>o
nnoremap <silent> yO :set paste<cr>O
autocmd InsertLeave *
    \ if &paste == 1 |
    \     set nopaste |
    \ endif

" Misc
set number
set ruler
set showcmd
set showmatch
set wildmenu
set wildmode=longest,list,full

" Also used by CtrlP
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

set hidden
set modeline
set autoread       " auto-reload modified files (with no local changes)
set nocompatible   " don't try to be compatible with vi
set ignorecase     " ignore case in search
set smartcase      " override ignorecase if uppercase is used in search string
set report=0       " report all changes
set laststatus=2   " always show status-line
" set cursorline     " highlight current line
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


" Easier window switching
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k

" Quit all with ZA
nnoremap ZA :qall<CR>

" show spaces with F2
nnoremap <f2> :<C-U>setlocal lcs=tab:>-,trail:~,eol:$,extends:>,precedes:<,nbsp:+ list! list?<CR>


" Theme
set t_Co=256
let g:solarized_termcolors=16
colorscheme zenburn
set background=dark

" Airline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1

" Keep swap files in one of these
set directory=~/tmp,/var/tmp,/tmp,.

" Let's see some useful info in the status line
set statusline=%F\ B:%-10.3n\ %m%r%w%y\ %=(%L\ loc)\ [#\%03.3b\ 0x\%02.2B]\ \ %l,%v\ \ %P

""""""""""""""""""""""""
" NeoComplCache Settings
""""""""""""""""""""""""
" " Disable AutoComplPop.
" let g:acp_enableAtStartup = 0
" " Use neocomplcache.
" let g:neocomplcache_enable_at_startup = 1
" " Use smartcase.
" let g:neocomplcache_enable_smart_case = 1
" " Set minimum syntax keyword length.
" let g:neocomplcache_min_syntax_length = 3
" let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"
" " Enable heavy features.
" " Use camel case completion.
" "let g:neocomplcache_enable_camel_case_completion = 1
" " Use underbar completion.
" "let g:neocomplcache_enable_underbar_completion = 1
" " Define dictionary.
" let g:neocomplcache_dictionary_filetype_lists = {
"     \ 'default' : '',
"     \ 'vimshell' : $HOME.'/.vimshell_hist',
"     \ 'scheme' : $HOME.'/.gosh_completions'
"         \ }
" " Define keyword.
" if !exists('g:neocomplcache_keyword_patterns')
"     let g:neocomplcache_keyword_patterns = {}
" endif
" let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
" " Plugin key-mappings.
" inoremap <expr><C-g>     neocomplcache#undo_completion()
" inoremap <expr><C-l>     neocomplcache#complete_common_string()
"
" " Recommended key-mappings.
" " <CR>: close popup and save indent.
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function()
"   return neocomplcache#smart_close_popup() . "\<CR>"
"   " For no inserting <CR> key.
"   "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
" endfunction
" " <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" " <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
" inoremap <expr><C-y>  neocomplcache#close_popup()
" inoremap <expr><C-e>  neocomplcache#cancel_popup()
" " Close popup by <Space>.
" "inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"
"
" " For cursor moving in insert mode(Not recommended)
" "inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
" "inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
" "inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
" "inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" " Or set this.
" "let g:neocomplcache_enable_cursor_hold_i = 1
" " Or set this.
" "let g:neocomplcache_enable_insert_char_pre = 1
"
" " AutoComplPop like behavior.
" "let g:neocomplcache_enable_auto_select = 1
"
" " Shell like behavior(not recommended).
" "set completeopt+=longest
" "let g:neocomplcache_enable_auto_select = 1
" "let g:neocomplcache_disable_auto_complete = 1
" "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
"
" " Enable omni completion.
" autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
" autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
" autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
" autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"
" " Enable heavy omni completion.
" if !exists('g:neocomplcache_omni_patterns')
"   let g:neocomplcache_omni_patterns = {}
" endif
" let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
" let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
" let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
"
" " For perlomni.vim setting.
" " https://github.com/c9s/perlomni.vim
" let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

""""""""""""""""""""""""""""
" End NeoComplCache Settings
""""""""""""""""""""""""""""

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
set mouse+=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

" Path modification
set path+=**

" Create an empty line underneath without moving the cursor
" This breaks quickfix
" noremap <CR> mlo<Esc>`l


" Move easily between ^ and $
noremap <C-h> ^
noremap <C-l> $

noremap j gj
noremap k gk

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

    let g:ag_prg='ag --vimgrep'
    let g:ackprg='ag --vimgrep'
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

" Tagbar
" nmap <F8> :TagbarToggle<CR>
" let g:tagbar_width=80

" Numbers
nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>
let g:enable_numbers=1


" Nerd Commenter
let NERDSpaceDelims = 1

" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" End EasyAlign

" Quick Scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" persistent_undo
if has("persistent_undo")
  set undodir=~/.undodir/
  set undofile
endif

" UndoTree
nnoremap <F5> :UndotreeToggle<CR>

" NeoVim
if has('nvim')
  " tnoremap <Esc> <C-\><C-n>
endif

" Play nice with tmux using screen-256color as default TERM
if &term =~ '^screen'
  " tmux will send xterm-style keys when xterm-keys is on
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
  set t_F3=[25~
  set t_F4=[26~
  set t_F5=[27~
  set t_F6=[28~
  set t_F7=[29~
  set t_F8=[30~
  set t_F9=[31~
endif


" normal, visual and select and operator pending mode
map <F9> :Dispatch<CR>

" Enable HardTime
let g:hardtime_default_on = 1
