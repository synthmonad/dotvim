set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" additional plugins
Plugin 'altercation/vim-colors-solarized'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tpope/vim-rails'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-endwise'

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

" ##Visual
" Prettiness on the bottom {{{
" That weird colorful line on the bottom
"let g:airline_theme='tomorrow'
set laststatus=2
set encoding=utf-8
if has("gui_running")
  let g:airline_powerline_fonts=1
  " Even special font for this crap
  set guifont=Source\ Code\ Pro\ for\ Powerline:h13
endif

function! AirlineOverride(...)
  let g:airline_section_a = airline#section#create(['mode'])
  let g:airline_section_b = airline#section#create_left(['branch'])
  let g:airline_section_c = airline#section#create_left(['%f'])
  let g:airline_section_y = airline#section#create([])
endfunction
autocmd VimEnter * call AirlineOverride()

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

