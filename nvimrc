set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.dotvim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Color themes for vim 
Plugin 'altercation/vim-colors-solarized'
Plugin 'fatih/molokai'

"Plugin 'fatih/vim-go'
"Plugin 'majutsushi/tagbar'

" Airline - line which is displayed on the bottom of the vim
Plugin 'bling/vim-airline'

" Nerdtree - for showing files in the sidebar (F3)
Plugin 'scrooloose/nerdtree' 

" Ctrl-P - for fast file serach
Plugin 'kien/ctrlp.vim'

"Plugin 'Shougo/neocomplete'
"Plugin 'Shougo/neosnippet'
"Plugin 'Shougo/neosnippet-snippets'

"Plugin 'garyburd/go-explorer'


"Plugin 'Raimondi/delimitMate'

" Dash integration
Plugin 'rizzatti/dash.vim'

" Rust plugins
"Plugin 'rust-lang/rust.vim'

" Elixir plugins
"Plugin 'elixir-lang/vim-elixir'
"Plugin 'vim-syntastic/syntastic'

" javascript, coffeescript
Plugin 'jelera/vim-javascript-syntax'
Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript'

" Rails
"Plugin 'tpope/vim-ragtag'
"Plugin 'tpope/vim-rails'
"Plugin 'tpope/vim-rake'
"Plugin 'vim-ruby/vim-ruby'

" Plugin 'christoomey/vim-tmux-runner'
" Plugin 'gabebw/vim-spec-runner'

Plugin 'tpope/vim-fugitive'

" Python indentation plugin
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'

"Plugin 'szw/vim-tags'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax on        " syntax highlighting
set encoding=utf-8 " setting encoding to UTF-8
set showcmd        " display incomplete commands

set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set nosmartindent
set autoindent

filetype on " load file type plugins + indentation
filetype indent on
filetype plugin on

au FileType * setlocal formatoptions-=cro
autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
inoremap # X<BS>#

set number " show lines numbers
set nowrap " no wrapping
set guifont=Inconsolata:h15 " which font do we want use
" color scheme setup for Terminal
set background=dark

if has('gui_running')
else
  let g:solarized_termcolors=256
endif

set wildignore+=*/vendor/**
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

set noswapfile 

let mapleader=","

noremap <leader>s :w<CR>
vnoremap <leader>s <Esc>:wgv<CR>
inoremap <leader>s <Esc>:w<CR>

noremap <leader>q :q<CR>
vnoremap <leader>q <Esc>:q<CR>
inoremap <leader>q <Esc>:q<CR>

" Splits tweaks {{{
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

""""""""""""""""""""""""""""""""""""""""""""""""""
" ARROW KEYS ARE UNACCEPTABLE
""""""""""""""""""""""""""""""""""""""""""""""""""
map <Left> :echo "no!"<CR>
map <Right> :echo "no!"<CR>
map <Up> :echo "no!" <CR>
map <Down> :echo "no!" <CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" MULTIPURPOSE TAB KEY
"" Indent if we're at the beginning of a line. Else, do completion.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"function! InsertTabWrapper()
"  let col = col('.') - 1
"  if !col || getline('.')[col - 1] !~ '\k'
"    return "\<tab>"
"  else
"    return "\<c-p>"
"  endif
"endfunction
"
"inoremap <tab> <c-r>=InsertTabWrapper()<cr>
"inoremap <s-tab> <c-n>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>n :call RenameFile()<cr>

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

autocmd FileType ruby nmap <F5> :!ruby %<cr>

silent! nmap <C-p> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>

let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"

function! AirlineOverride(...)
  let g:airline_section_a = airline#section#create(['mode'])
  let g:airline_section_b = airline#section#create_left(['branch'])
  let g:airline_section_c = airline#section#create_left(['%f'])
  let g:airline_section_y = airline#section#create([])
endfunction
autocmd VimEnter * call AirlineOverride()

set laststatus=2

" Extra info on the bottom
set ruler

" Highlight current line
set cursorline

" ##Search tweaks {{{
set hlsearch
set incsearch
" Kill current search
nnoremap <silent> <Leader>/ :nohlsearch<CR>
"}}}

" Tweak ESC to be 'jk' typed fast
imap jk <ESC>

set background=dark
" solarized options
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme molokai 

" NerdTree
map <C-n> :NERDTreeToggle<CR>

"Ctrl-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_split_window = 0

let g:ctrlp_custom_ignore = 'tmp$\|env$\|\.git$\|\.hg$\|\.svn$\|\.rvm$\|vendor$'

" " Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"Disabling rustc due to wrong error handling
"let g:syntastic_rust_checkers = ['rustc']

let g:syntastic_python_pylint_args = "--load-plugins pylint_django"
let g:syntastic_htmldjango_checkers = ['python/pylint']

" ignoring swp files
set wildignore+=*.swp,*~,._*


" Vim tmux runner
" I don't want the default key mappings
let g:VtrUseVtrMaps = 0
" Vim spec runner
let g:spec_runner_dispatcher = 'call VtrSendCommand("{command}")'
map <Leader>t <Plug>RunCurrentSpecFile
map <Leader>tt <Plug>RunFocusedSpec
map <Leader>tl <Plug>RunMostRecentSpec

"Dash plugin
nmap <silent> <leader>d <Plug>DashSearch
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix


au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

" Flagging unnecessary whitespaces
highlight BadWhitespace ctermbg=red guibg=red

au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

syntax on

vnoremap < <gv
vnoremap > >gv

vmap <M-]> >gv
vmap <M-[> <gv
