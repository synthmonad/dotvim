source ~/.dotvim/bundle/vim-pathogen/autoload/pathogen.vim

execute pathogen#infect()

set nocompatible " choose no compatibility with vi
syntax on        " syntax highlighting
set encoding=utf-8 " setting encoding to UTF-8
set showcmd        " display incomplete commands
filetype plugin indent on " load file type plugins + indentation
set guifont=Inconsolata:h17 " which font do we want use
set number " show lines numbers

