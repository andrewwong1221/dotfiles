" Tabs and Spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab


if has("nvim")
  let g:basepath="$HOME" . "/.config/nvim/"
else
  let g:basepath="$HOME" . "/.vim/"
endif

" C Indent Google style
set cino+=(0

if has('conceal') 
  set conceallevel=2
endif


" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary

" Bootstrap NeoBundle
filetype off

if !isdirectory(expand("~/.config/nvim/bundle/neobundle.vim"))
  echo "Installing NeoBundle..."
  echo ""
	silent !mkdir -p ~/.config/nvim/bundle
	!git clone git://github.com/Shougo/neobundle.vim.git ~/.config/nvim/bundle/neobundle.vim
	let s:bootstrap=1 " indicate that we are installing for the first time
endif


" Setup neobundle
if has('vim_starting')
  set runtimepath+=~/.config/nvim/bundle/neobundle.vim/
  set runtimepath+=~/.config/nvim/bundle/vim-pathogen/
endif
" Install pathogen
call pathogen#infect()

call neobundle#begin(expand('~/.config/nvim/bundle'))
" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" =============
" BEGIN PLUGINS
" =============

" vimproc
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

" Essentials
NeoBundle 'tpope/vim-pathogen'  " Automatic path management
NeoBundle 'bling/vim-airline'
NeoBundle 'ctrlpvim/ctrlp.vim'  " Ctrl P
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tpope/vim-surround'  " Surround word objects
NeoBundle 'tpope/vim-commentary' " Comments
NeoBundle 'tpope/vim-repeat'    " Repeat special commands
NeoBundle 'tpope/vim-vinegar'   " Better netrw
NeoBundle 'myusuf3/numbers.vim'

" VCS
NeoBundle 'tpope/vim-fugitive'  " Git
NeoBundle 'airblade/vim-gitgutter' " More git commands

" Languages
NeoBundle 'tpope/vim-markdown'  " Markdown
NeoBundle 'rust-lang/rust.vim'
NeoBundle 'tpope/vim-classpath' " Something java
NeoBundle 'tpope/vim-fireplace' " Clojure?
NeoBundle 'guns/vim-clojure-static'
NeoBundle 'vim-scripts/paredit.vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'elzr/vim-json'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'mustache/vim-mustache-handlebars'
NeoBundle 'fatih/vim-go'
NeoBundle 'mxw/vim-jsx' " React

" Fuzzy Finder
NeoBundle 'junegunn/fzf', {'dir': '~/.fzf', 'do': 'yes \| ./install --all'}
NeoBundle 'junegunn/fzf.vim'

" Other plugins
NeoBundle 'Lokaltog/vim-easymotion' " Easy motion
NeoBundle 'junegunn/vim-easy-align' " simple alignment

NeoBundle 'mattn/emmet-vim'
NeoBundle 'scrooloose/nerdcommenter'

NeoBundle 'MarcWeber/vim-addon-mw-utils' " Required by snipmate
NeoBundle 'tomtom/tlib_vim' " Utilities - Required by snipmate
NeoBundle 'garbas/vim-snipmate'
NeoBundle 'honza/vim-snippets'
NeoBundle 'godlygeek/tabular'
NeoBundle 'unblevable/quick-scope'

" Colorschemes
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'junegunn/seoul256.vim'

" ===========
" END PLUGINS
" ===========

" Local Vimrc (which may have plugins
if filereadable($HOME . "/.vimlocal") 
  source $HOME/.vimlocal
endif

if filereadable($HOME . "/.local.vim")
  source $HOME/.local.vim
endif

if filereadable($HOME . "/vim.local")
  source $HOME/vim.local
endif

if filereadable($HOME . "/.config/nvim/nvimrc.local")
  source $HOME/.config/nvim/nvimrc.local
endif


" All plugins must be added before the following line
call neobundle#end()         " required
filetype plugin indent on " required

" Install plugins if bootstrapping
if exists("s:bootstrap") && s:bootstrap
	unlet s:bootstrap
  NeoBundleCheck
endif

" Set spelling options
set spell spelllang=en_us

" Paste mode settings
set showmode
nnoremap <silent> yo :set paste<cr>o
nnoremap <silent> yO :set paste<cr>O
nnoremap <silent> yi :set paste<cr>i
nnoremap <silent> yI :set paste<cr>I
autocmd InsertLeave *
    \ if &paste == 1 |
    \     set nopaste |
    \ endif

" Visual settings
set number
set ruler     " show line ad column number of the cursor position
set showcmd   " Shows partial command in last line of screen
set showmatch " Show matching brackets

" Wildmenu setup
" Also used for ctrlp
set wildmode=longest,list,full
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

set hidden       " unload buffer when hidden
set modeline     " Enable the modeline
set report=0     " report all changes
set cursorline   " highlight current line
set scrolloff=4  " scroll when the cursor reaches the nth line from the bottom of the window
set nofoldenable " all folds are opened by default

" Search settings
set ignorecase   " ignore case in search
set smartcase    " override ignorecase if uppercase is used in search string

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

" Tab to switch tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT

" No one will cry if :W is corrected to :w
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
" Easy command mode switch
inoremap kj <Esc>

" Make <BS><Tab> useful in vim-snipmate
silent! snoremap <unique> <BS> b<BS>

" Auto complete whole line 
inoremap <C-l> <C-x><C-l>

" Move easily between ^ and $
noremap <C-h> ^

" Quit all with ZA
nnoremap ZA :qall<CR>

" show spaces with F2
nnoremap <f2> :<C-U>setlocal listchars=tab:>-,trail:~,eol:$,extends:>,precedes:<,nbsp:+ list! list?<CR>
" Numbers
nnoremap <F3> :NumbersToggle<CR>
nnoremap <F4> :NumbersOnOff<CR>


" Theme
set t_Co=256
colorscheme seoul256
set background=dark

" Airline
" let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1

" Disable swap and backup files
set nobackup
set noswapfile

" Let's see some useful info in the status line
set statusline=%F\ B:%-10.3n\ %m%r%w%y\ %=(%L\ loc)\ [#\%03.3b\ 0x\%02.2B]\ \ %l,%v\ \ %P


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

" Some c settings
if exists("c_no_names")
  unlet c_no_names
endif

" Path modification
set path+=**

noremap <C-l> $
nnoremap Q <Nop>

noremap j gj
noremap k gk

" Minimum window height = 0
set wmh=0

" CtrlP
set runtimepath^=~/.config/nvim/bundle/ctrlp.vim
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
    " let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    " let g:ctrlp_use_caching = 0

    let g:ackprg='ag --nogroup --nocolor --column'
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




" Nerd Commenter
let NERDSpaceDelims = 1 

" nnoremap <leader>* :lgrep! "\b<C-R><C-W>\b" . relgitdir . <CR>:lopen<CR>


" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
"
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" End EasyAlign

" Quick Scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']


" React
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" vim-airline magic
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif
