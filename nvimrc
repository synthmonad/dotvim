""""""" Plugin management stuff """""""
set nocompatible
filetype off

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

Plugin 'VundleVim/Vundle.vim'

" EasyMotion - Allows <leader><leader>(b|e) to jump to (b)eginning or (end) of words.
Plugin 'easymotion/vim-easymotion'

" Ctrl-P - Fuzzy file search
Plugin 'kien/ctrlp.vim'

" Neomake build tool (mapped below to <c-b>)
Plugin 'benekastah/neomake'

" Autocomplete for python
Plugin 'davidhalter/jedi-vim'
" Remove extraneous whitespace when edit mode is exited
Plugin 'thirtythreeforty/lessspace.vim'

Plugin 'altercation/vim-colors-solarized'
Plugin 'fatih/vim-go'
Plugin 'majutsushi/tagbar'

Plugin 'Shougo/neocomplete'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'fatih/molokai'
Plugin 'garyburd/go-explorer'
Plugin 'scrooloose/nerdtree'

" Status bar mods
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'

" Tab completion
Plugin 'ervandew/supertab'

" After all plugins...
call vundle#end()
filetype plugin indent on

""""""" Jedi-VIM """""""
" Don't mess up undo history
let g:jedi#show_call_signatures = "0"

""""""" SuperTab configuration """""""
"let g:SuperTabDefaultCompletionType = "<c-x><c-u>"
function! Completefunc(findstart, base)
    return "\<c-x>\<c-p>"
endfunction

"call SuperTabChain(Completefunc, '<c-n>')

"let g:SuperTabCompletionContexts = ['g:ContextText2']


""""""" General coding stuff """""""
" Highlight 80th column
set colorcolumn=79
" Always show status bar
set laststatus=1
" Let plugins show effects after 500ms, not 4s
set updatetime=500
" Disable mouse click to go to position
set mouse-=a
" Don't let autocomplete affect usual typing habits
set completeopt=menuone,preview,noinsert
" Let vim-gitgutter do its thing on large files
let g:gitgutter_max_signs=10000

" If your terminal's background is white (light theme), uncomment the following
" to make EasyMotion's cues much easier to read.
" hi link EasyMotionTarget String
" hi link EasyMotionShade Comment
" hi link EasyMotionTarget2First String
" hi link EasyMotionTarget2Second Statement


""""""" Python stuff """""""
syntax enable
set number showmatch
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent
let python_highlight_all = 1

" Neomake and other build commands (ctrl-b)
nnoremap <C-b> :w<cr>:Neomake<cr>

syntax on        " syntax highlighting
set encoding=utf-8 " setting encoding to UTF-8
set showcmd        " display incomplete commands

set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set smartindent
set autoindent

filetype on " load file type plugins + indentation
filetype indent on
filetype plugin on

au FileType * setlocal formatoptions-=cro

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

let mapleader=","

"noremap <leader>s :w<kEnter>
"inoremap <leader>s <Esc>:w<kEnter>i

noremap <leader>s :w<CR>
vnoremap <leader>s <Esc>:wgv<CR>
inoremap <leader>s <Esc>:w<CR>

noremap <leader>q :q<CR>
vnoremap <leader>q <Esc>:q<CR>
inoremap <leader>q <Esc>:q<CR>

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

nmap <F8> :TagbarToggle<CR>
"map <D-}> <C-w><Right>
"map <D-{> <C-w><Left>

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

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
"map <Leader>s :call RunNearestSpec()<CR>
"map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

set background=light
" solarized options
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized

" NerdTree
map <C-n> :NERDTreeToggle<CR>

"Ctrl-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_split_window = 0

" Splits tweaks {{{
"map <C-h> <C-w>h
map <BS> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

