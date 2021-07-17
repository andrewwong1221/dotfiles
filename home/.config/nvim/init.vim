" Andrew's Neovim Configuration
" =============================

" Basics {{{

" Encoding
set encoding=utf-8
silent! set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary

let mapleader = "," " Set Leader Key to ,


" Search settings
set ignorecase   " ignore case in search
set smartcase    " override ignorecase if uppercase is used in search string

" Reduce timeout
set timeoutlen=500

" C Indent Google style
set cino+=(0


" Enable live substitution
if exists('&inccommand')
  set inccommand=split
endif

" Tabs and Spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab " Must be below `set binary`

" Disable swap and backup files
set nobackup
set noswapfile
set nowritebackup


" Wildmenu setup
set wildmode=longest,list,full
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

set hidden       " unload buffer when hidden
set modeline     " Enable the modeline
set modelines=5  " Read 5 lines for modeline
set report=0     " report all changes
set cursorline   " highlight current line
set scrolloff=4  " scroll when the cursor reaches the nth line from the bottom of the window
set nofoldenable " all folds are opened by default

" Visual settings
set number
set ruler     " show line ad column number of the cursor position
set showcmd   " Shows partial command in last line of screen
set showmatch " Show matching brackets

" Set spelling options
set spell spelllang=en_us
" Disable spellcheck in quickfix window
autocmd BufReadPost quickfix setlocal nospell

" Enable mouse
set mouse=a


" shorter update time (default is 4s)
set updatetime=300

" Don't pass messages to |ins-completion-menu|
set shortmess+=c


" Always show the signcolumn
set signcolumn=yes


" Path modification
set path+=**

" Minimum window height = 0
set wmh=0

" persistent_undo
if has("persistent_undo")
  set undofile
endif

" Return to original place in file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Turn on wrapping in diff mode
autocmd FilterWritePre * if &diff | setlocal wrap< | endif

" }}}

" Tmux {{{
if &term =~ '^screen'
  set ttymouse=xterm2
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
" }}}

" Bootstrap vim-plug {{{
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" }}}

" Plugins {{{
call plug#begin(expand('~/.config/nvim/plugged'))


" Essentials
Plug 'tpope/vim-pathogen'  " Automatic path management
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'  " Surround word objects
Plug 'tpope/vim-commentary' " Comments
Plug 'tpope/vim-repeat'    " Repeat special commands
Plug 'tpope/vim-vinegar'   " Better netrw
Plug 'tpope/vim-sleuth'    " Detect whitespace settings
Plug 'myusuf3/numbers.vim'
Plug 'ntpeters/vim-better-whitespace'  " :StripWhitespace

" highlighting
Plug 'luochen1990/rainbow'

" VCS
Plug 'tpope/vim-fugitive'  " Git
Plug 'airblade/vim-gitgutter' " More git commands

" Languages
Plug 'plasticboy/vim-markdown'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-classpath' " Something java
Plug 'tpope/vim-fireplace' " Clojure?
Plug 'guns/vim-clojure-static'
Plug 'vim-scripts/paredit.vim'
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'kchmck/vim-coffee-script'
Plug 'mustache/vim-mustache-handlebars'
Plug 'fatih/vim-go'
Plug 'mxw/vim-jsx' " React

" Auto run ctags on save (see ^] for usage)
Plug 'craigemery/vim-autotag'

" Fuzzy Finder
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': 'yes \| ./install --all'}
Plug 'junegunn/fzf.vim'

" Distraction Free writing
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Other plugins
Plug 'easymotion/vim-easymotion' " Easy motion
Plug 'junegunn/vim-easy-align' " simple alignment

Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdcommenter'

" Snipmate
" Plug 'MarcWeber/vim-addon-mw-utils' " Required by snipmate
" Plug 'tomtom/tlib_vim' " Utilities - Required by snipmate
" Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

Plug 'godlygeek/tabular'
Plug 'unblevable/quick-scope'

" Neomake
Plug 'neomake/neomake'

" Messes up bindings too much
" Plug 'wellle/context.vim'

Plug 'vimwiki/vimwiki'
" Plug 'rhysd/vim-clang-format'

" Colorschemes
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/seoul256.vim'

" Tagbar
Plug 'majutsushi/tagbar'

" coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jackguo380/vim-lsp-cxx-highlight'
" :CocInstall coc-snippets

" All plugins must be added before the following line
call plug#end()         " required

"}}}

" Load Local Configuration Files {{{
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
" }}}

" Key Mappings {{{

" Move easily between ^ and $
noremap <C-h> ^
noremap <C-l> $

noremap j gj
noremap k gk

" Disable Ex mode
nnoremap Q <Nop>

" Paste mode settings
set showmode
nnoremap <silent> yo :set paste<cr>o
nnoremap <silent> yO :set paste<cr>O
autocmd InsertLeave *
    \ if &paste == 1 |
    \     set nopaste |
    \ endif

"
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

" split to the right
set splitright

" Easy command mode switch
inoremap kj <Esc>

" Make <BS><Tab> useful in vim-snipmate
" silent! snoremap <unique> <BS> b<BS>

" Auto complete whole line
imap <C-l> <C-x><C-l>
imap <C-f> <C-x><C-f>
inoremap <C-d> <Esc>S

" Quit all with ZA
nnoremap ZA :qall<CR>

  " Function Keys  {{{
  
  " show spaces with F2
  nnoremap <F2> :<C-U>setlocal listchars=tab:→\ ,trail:•,eol:§,extends:⟩,precedes:⟨,nbsp:␣ list! list?<CR>
  nnoremap <F3> :NumbersToggle<CR>
  nnoremap <F4> :NumbersOnOff<CR>

  nnoremap <F5> :Neomake!<CR>
  " nnoremap <F6> :NeomakeSh! rakefds --color=never<CR> (see .vimlocal)
  nnoremap <F7> :ContextToggle<CR>
  nnoremap <F8> :TagbarToggle<CR>

  nnoremap <F9> :copen<CR>
  nnoremap <F12> :vsplit $MYVIMRC<CR>


  " }}}

" }}}

" NetRW Settings {{{
let g:netrw_preview      = 0   " No vertical preview
let g:netrw_winsize      = 75  " New netrw window size
let g:netrw_keepdir      = 1   " 1 == Don't change vim's current directory with netrw
let g:netrw_browse_split = 4   " Use the last window to open the file
let g:netrw_altv         = 1   " Split on the right
let g:netrw_banner       = 0   " No Banner
let g:netrw_liststyle    = 3   " Tree style listing
let g:netrw_sort_options = 'i' " Case insensitive sorting
let g:netrw_localrmdir   = "rm -r"

" }}}

" Theme {{{
" set t_Co=256
silent! colorscheme seoul256
set background=dark

" }}}

" Other {{{


" Let's see some useful info in the status line
set statusline=%F\ B:%-10.3n\ %m%r%w%y\ %=(%L\ loc)\ [#\%03.3b\ 0x\%02.2B]\ \ %l,%v\ \ %P


" File-type
filetype on
filetype plugin on
filetype indent on
au CursorHold * checktime " Is this needed, might be for WatchForChanges

" Show trailing white-space
let ruby_space_errors = 1
let c_space_errors = 1
let javascript_space_errors = 1

" Syntastic options
" let g:syntastic_check_on_open = 1
" let g:syntastic_aggregate_errors = 0
let c_C99 = 1


" Some c settings
if exists("c_no_names")
  unlet c_no_names
endif

" }}}

" Plugin Settings {{{

  " FZF {{{

  " Mapping selecting mappings
  noremap <C-p> :Files<CR>
  nmap <leader><tab> <plug>(fzf-maps-n)
  xmap <leader><tab> <plug>(fzf-maps-x)
  omap <leader><tab> <plug>(fzf-maps-o)

  " Insert mode completion
  imap <c-x><c-k> <plug>(fzf-complete-word)
  imap <c-x><c-f> <plug>(fzf-complete-path)
  imap <c-x><c-j> <plug>(fzf-complete-file-ag)
  imap <c-x><c-l> <plug>(fzf-complete-line)

  " Advanced customization using autoload functions
  inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

  function! s:fzf_statusline()
    " Override statusline as you like
    highlight fzf1 ctermfg=161 ctermbg=251
    highlight fzf2 ctermfg=23 ctermbg=251
    highlight fzf3 ctermfg=237 ctermbg=251
    setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
  endfunction

  autocmd! User FzfStatusLine call <SID>fzf_statusline()


  " }}}

  " Ag settings {{{
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

  " End Ag }}}


  " Nerd Commenter
  let NERDSpaceDelims = 1

  " EasyAlign {{{
  " Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
  vmap <Enter> <Plug>(EasyAlign)
  "
  " Start interactive EasyAlign for a motion/text object (e.g. gaip)
  nmap ga <Plug>(EasyAlign)
  " End EasyAlign }}}


  " React
  let g:jsx_ext_required = 0 " Allow JSX in normal JS files

  " vim-airline magic {{{
  " Airline
  let g:airline_powerline_fonts=1
  let g:airline#extensions#tabline#enabled=1

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

  " }}}

  " Terminal settings {{{
  tnoremap kj <C-\><C-n>
  tnoremap <Leader><ESC> <C-\><C-n>

  augroup terminal
    autocmd TermOpen * setlocal nospell
  augroup END

  " }}}

  " Neomake {{{
  let g:neomake_warning_sign = {'text': '⚠', 'texthl': 'NeomakeWarningSign'}
        " To always show errors, make the error format '%m'
        " \ 'errorformat': '%m',

  let g:neomake_open_list=1 " Show the quickfix window after running NeomakeSh or NeomakeSh!


  function! NeomakeShowJobStatusOnFinished() abort
    let context = g:neomake_hook_context
    if context.jobinfo.exit_code == 0
      echom printf('The job for maker %s exited successfully',
            \ context.jobinfo.maker.name)
    elseif context.jobinfo.exit_code != 0
      echom printf('The job for maker %s exited non-zero: %s',
            \ context.jobinfo.maker.name, context.jobinfo.exit_code)
    endif
  endfunction
  augroup my_neomake_hooks
    au!
    autocmd User NeomakeJobFinished call NeomakeShowJobStatusOnFinished()
  augroup END

  " }}}

  " Vimwiki {{{
  let g:vimwiki_folding='expr'
  let g:vimwiki_list = [{'path': '~/.vimwiki/vimwiki',
                      \  'syntax': 'markdown', 'ext': '.md'},
                      \ {'path': '~/.vimwiki/perfsyswiki',
                      \  'syntax': 'markdown', 'ext': '.md'}]
  " }}}

  " Rainbow parens {{{
  let g:rainbow_active = 1
  let g:rainbow_conf = {
  \ 'guifgs': ['royalblue3',   'darkorange3', 'seagreen3', 'firebrick'],
  \ 'ctermfgs': ['lightblue', 'lightyellow', 'darkblue', 'darkred', 'brown', 'lightcyan', 'lightmagenta', 'darkcyan'],
  \ 'operators': '_,_',
  \ 'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
  \ 'separately': {
  \   '*': {},
  \   'tex': {
  \     'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
  \   },
  \   'lisp': {
  \     'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
  \   },
  \   'vim': {
  \     'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
  \   },
  \   'html': {
  \     'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
  \   },
  \   'css': 0,
  \   }
  \ }
  " }}}

  " Context Plugin {{{
  let g:context_enabled = 0
  " }}}


  " coc.nvim {{{
  " From coc.nvim readme and coc-snippets readme

  if exists('g:coc_enabled')
    let g:coc_global_extensions = [ 'coc-json', 'coc-git', 'coc-clangd', 'coc-html', 'coc-explorer', 'coc-css' ]

    " coc-explorer
    nnoremap <space>e :CocCommand explorer
      \ --toggle
      \ --sources=buffer+,file+<CR>

    let g:coc_snippet_next = '<tab>'

    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-space> to trigger completion.
    inoremap <silent><expr> <c-space> coc#refresh()

    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
    " position. Coc only does snippet and additional edit on confirm.
    if has('patch8.1.1068')
      " Use `complete_info` if your (Neo)Vim version supports it.
      inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
    else
      imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    endif

    " Use `[g` and `]g` to navigate diagnostics
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window.
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction

    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Symbol renaming.
    nmap <leader>rn <Plug>(coc-rename)

    " Formatting selected code.
    xmap <leader>cf  <Plug>(coc-format-selected)
    nmap <leader>cf  <Plug>(coc-format-selected)

    augroup mygroup
      autocmd!
      " Setup formatexpr specified filetype(s).
      autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
      " Update signature help on jump placeholder.
      autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    " Applying codeAction to the selected region.
    " Example: `<leader>aap` for current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)

    " Remap keys for applying codeAction to the current line.
    nmap <leader>ac  <Plug>(coc-codeaction)
    " Apply AutoFix to problem on the current line.
    nmap <leader>qf  <Plug>(coc-fix-current)

    " Introduce function text object
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
    xmap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap if <Plug>(coc-funcobj-i)
    omap af <Plug>(coc-funcobj-a)

    " Use <TAB> for selections ranges.
    " NOTE: Requires 'textDocument/selectionRange' support from the language server.
    " coc-tsserver, coc-python are the examples of servers that support it.
    nmap <silent> <TAB> <Plug>(coc-range-select)
    xmap <silent> <TAB> <Plug>(coc-range-select)

    " Add `:Format` command to format current buffer.
    command! -nargs=0 Format :call CocAction('format')

    " Add `:Fold` command to fold current buffer.
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)

    " Add `:OR` command for organize imports of the current buffer.
    command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

    " Add (Neo)Vim's native statusline support.
    " NOTE: Please see `:h coc-status` for integrations with external plugins that
    " provide custom statusline: lightline.vim, vim-airline.
    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

    " Mappings using CoCList:
    " Show all diagnostics.
    nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
    " Manage extensions.
    " nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
    " Rebound to space-x
    nnoremap <silent> <space>x  :<C-u>CocList extensions<cr>
    " Show commands.
    nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
    " Find symbol of current document.
    nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
    " Search workspace symbols.
    nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    nnoremap <silent> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list.
    nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

  endif

  " }}}

  " vimspector {{{
  let g:vimspector_enable_mappings = 'HUMAN'
  " }}}

  " Disable autotag on xml files
  let g:autotagExcludeFiletypes="xml"

  " Disable json conceal
  let g:vim_json_syntax_conceal = 0

" }}}
