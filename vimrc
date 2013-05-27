source ~/.dotvim/bundle/vim-pathogen/autoload/pathogen.vim

execute pathogen#infect()

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
set nowrap " no wrapping
set guifont=Inconsolata:h15 " which font do we want use
" color scheme setup for Terminal
set background=light

if has('gui_running')

else
    let g:solarized_termcolors=256
endif

colorscheme solarized

