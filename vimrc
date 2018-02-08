" no vi compatibility (same as ocp)
set nocompatible

if $ADMIN_SCRIPTS == ""
  let $ADMIN_SCRIPTS = "/mnt/vol/engshare/admin/scripts"
endif

if $LOCAL_ADMIN_SCRIPTS == ""
  let $LOCAL_ADMIN_SCRIPTS = "/usr/facebook/ops/rc/"
endif

if !empty(glob("$ADMIN_SCRIPTS/master.vimrc"))
  source $ADMIN_SCRIPTS/master.vimrc
endif

call plug#begin('~/.vim/plugged')
" Plug!
" Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-endwise'
Plug 'Shougo/neocomplcache'
Plug 'Shougo/vimproc'
" Plug 'mileszs/ack'
Plug 'msanders/snipmate.vim'
Plug 'gerw/vim-latex-suite'
Plug 'vim-scripts/taglist.vim'
Plug 'kien/ctrlp.vim'
Plug 'walm/jshint.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'tsaleh/vim-matchit'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-ragtag'
Plug 'vim-scripts/vimwiki'
Plug 'vim-scripts/closetag.vim'
Plug 'tpope/vim-commentary'
Plug 'kchmck/vim-coffee-script'
" Plug 'lukerandall/haskellmode-vim'
Plug 'eagletmt/ghcmod-vim'
Plug 'ujihisa/neco-ghc'
Plug 'mattn/emmet-vim'

Plug 'elixir-lang/vim-elixir'

Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0

Plug 'jelera/vim-javascript-syntax'

" vim-scripts repos
Plug 'vim-scripts/L9'
Plug 'vim-scripts/FuzzyFinder'
Plug 'vim-scripts/xmledit'

Plug 'w0rp/ale'
Plug 'Valloric/YouCompleteMe'

call plug#end()

let g:javascript_plugin_flow = 1
" Asynchronous Lint Engine (ALE)
" Limit linters used for JavaScript.
let g:ale_linters = {
\ 'javascript': ['flow']
\ }
highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
highlight clear ALEWarningSign " otherwise uses error bg color (typically red)
let g:ale_sign_error = 'X' " could use emoji
let g:ale_sign_warning = '?' " could use emoji
let g:ale_statusline_format = ['X %d', '? %d', '']
" %linter% is the name of the linter that provided the message
" %s is the error or warning message
let g:ale_echo_msg_format = '%linter% says %s'
" Map keys to navigate between lines with errors and warnings.
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>

set modelines=0

call pathogen#infect()
call pathogen#helptags()

" directory
set directory=/Users/adam/Dropbox/dotfiles/.vim

" disable backups (and swap)
set nobackup
set nowritebackup
set noswapfile

" wrap searches
set wrapscan

" tab and indentation
set tabstop=4
set softtabstop=4
set noexpandtab
set smarttab
set shiftwidth=4
set backspace=indent,eol,start
set autoindent
set smartindent
set hidden
set wildmenu
set wildmode=list:longest
set ttyfast
set cursorline
set laststatus=2
" set relativenumber
set undofile
set nopaste

" show commands
set showcmd

" yank to paste buffer
"set clipboard=unnamedplus

" show line and column position of cursor
set ruler

" status bar
set statusline=\ \%f%m%r%h%w\ ::\ %y\ [%{&ff}]\%=\ [%p%%:\ %c,%l/%L]\
"set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
set laststatus=2
set cmdheight=1


" textwidth
"set textwidth=80

" formatting options
set formatoptions=c,q,r,t

" line numbers
set number

" search
set hlsearch
set incsearch
set ignorecase
set smartcase

" syntax highlighting
filetype plugin on
syntax on

" enable mouse
set mouse=a

" set colorscheme
" colorscheme solarized
" colorscheme dawn
" colorscheme vylight
set background=dark
colorscheme solarized


"allows sudo with :w!!
cmap w!! %!sudo tee > /dev/null %

" auto indent
filetype plugin indent on

" leader key to ,
let mapleader=","

" source matchit.vim so that % can search through if/else/etc
runtime plugins/matchit.vim

" maintain more context around cursor
set scrolloff=3

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" VERY useful remap
nnoremap ; :
nnoremap j gj
nnoremap k gk
"nnoremap s l
"nnoremap l s
"vnoremap s l
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" fix regex so it's like perl/python
nnoremap / /\v
vnoremap / /\v

" clear highlights with ,<space>
nnoremap <leader><space> :noh<cr>

" map tab to %
nnoremap <tab> %

" hides buffers instead of closing them
set hidden

set history=1000   " remember more commands and search history
set undolevels=1000 " use many levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
"set title "terminal title

" Shows spaces as you're writing
"set list
"set listchars=tab:>.trail:.,extends:#,nbsp:.

set pastetoggle=<F2>

" Help key annoyance
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" auto-save on leaving focus
au FocusLost * :wa

" remove trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Ack
nnoremap <leader>a :Ack

" reselect things just pasted
nnoremap <leader>v V`]

" quick exit from insert
inoremap jj <ESC>

" open a new split and go to it ,w
nnoremap <leader>w <C-w>v<c-w>l

" remap for C-moving windowsing
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" Tex-Live grep fix
set grepprg=grep\ -nH\ $*

" Python stuff
autocmd BufRead,BufNewFile *.py set ai
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,with,try,except,finally,def,class

" indent-guides config
set ts=2 sw=2 et
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=darkgrey   ctermbg=darkgrey
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=grey ctermbg=grey

"tpope ragtag vim
let g:ragtag_global_maps = 1

"tagbar config
nmap <leader>t :TagbarToggle<CR>

"fuzzyfinder config
nnoremap <leader>f :FufFile<CR>
nnoremap <leader>b :FufBuffer<CR>

"eclim
" ,i imports whatever is needed for current line
nnoremap <silent> <LocalLeader>i :JavaImport<cr>
" ,d opens javadoc for statement in browser
nnoremap <silent> <LocalLeader>d :JavaDocSearch -x declarations<cr>
" ,<enter> searches context for statement
nnoremap <silent> <LocalLeader><cr> :JavaSearchContext<cr>
" ,jv validates current java file
nnoremap <silent> <LocalLeader>jv :Validate<cr>
" ,jc shows corrections for the current line of java
nnoremap <silent> <LocalLeader>jc :JavaCorrect<cr>
"use default Taglist instead of Eclim, avoid problem
let g:EclimTaglistEnabled=0
"if the current file is in a Eclipse project, open project tree automatically
let g:EclimProjectTreeAutoOpen=1
let g:EclimProjectTreeExpandPathOnOpen=1
let g:EclimProjectTreeSharedInstance=1  "share tree instance through all tabs
" use tabnew instead of split for new action
let g:EclimProjectTreeActions = [ {'pattern': '.*', 'name': 'Tab', 'action': 'tabnew'} ]

"LaTeX
"Compile to pdf
let g:Tex_CompileRule_dvi = 'pdflatex $*'
"auto recompile upon save
autocmd BufWritePost *.tex execute "normal ,ll"
"custom folds
let g:Tex_FoldedEnvironments = 'question,verbatim,comment,eq,gather,itemize,align,figure,table,thebibliography,keywords,abstract,titlepage'
"awesome macros
autocmd BufRead,BufNewFile *.tex call IMAP('`s', '\sum_{<++>}^{<++>}<++>', 'tex')
autocmd BufRead,BufNewFile *.tex call IMAP('`m', '\mathbb{<++>}<++>', 'tex')
autocmd BufRead,BufNewFile *.tex call IMAP('`v', '\verb~<++>~<++>', 'tex')
autocmd BufRead,BufNewFile *.tex call IMAP('`l', '\lambda', 'tex')

"make sig files have proper highlighting
autocmd BufRead,BufNewFile *.sig set filetype=sml
autocmd BufRead,BufNewFile sources.cm set filetype=sml
autocmd BufRead,BufNewFile *.ispc set filetype=ispc
autocmd BufRead,BufNewFile *todo.txt set filetype=todo.txt

"make haskell files override 'K' functionality
autocmd FileType haskell nnoremap K :call Haddock()
autocmd ShellCmdPost *.hs redraw!
let g:haddock_browser = '/usr/bin/lynx'

"fix the bad search color with solarized
hi Search ctermbg=7

"Scala tagbar configuration
let g:tagbar_type_scala = {
    \ 'ctagstype' : 'Scala',
    \ 'kinds'     : [
        \ 'p:packages:1',
        \ 'V:values',
        \ 'v:variables',
        \ 'T:types',
        \ 't:traits',
        \ 'o:objects',
        \ 'a:aclasses',
        \ 'c:classes',
        \ 'r:cclasses',
        \ 'm:methods'
    \ ]
\ }
"Start Tagbar for Scala files
autocmd BufRead,BufNewFile *.scala execute "normal ,t"
autocmd BufWritePre *.rb :%s/\s\+$//e
autocmd BufWritePre *.erb :%s/\s\+$//e
autocmd BufWritePre *.js :%s/\s\+$//e
