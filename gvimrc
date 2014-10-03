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

set nocompatible " choose no compatibility with vi
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

set number " show lines numbers

set guifont=Inconsolata:h15 " which font do we want use
" color scheme setup for Terminal
set background=dark

if has('gui_running')

else
    let g:solarized_termcolors=256
endif

colorscheme solarized

" ##Visual
" Prettiness on the bottom {{{
" That weird colorful line on the bottom
let g:airline_theme='tomorrow'
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

