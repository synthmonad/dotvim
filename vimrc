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
set background=dark

if has('gui_running')
else
    let g:solarized_termcolors=256
endif

colorscheme solarized

set wildignore+=*/vendor/**

let mapleader=","

"noremap <leader>s :w<kEnter>  
"inoremap <leader>s <Esc>:w<kEnter>i 

inoremap jj <ESC>

noremap <leader>s :w<CR>
vnoremap <leader>s <Esc>:wgv<CR>
inoremap <leader>s <Esc>:w<CR>

noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

""""""""""""""""""""""""""""""""""""""""""""""""""
" ARROW KEYS ARE UNACCEPTABLE
""""""""""""""""""""""""""""""""""""""""""""""""""
map <Left> :echo "no!"<CR>
map <Right> :echo "no!"<CR>
map <Up> :echo "no!" <CR>
map <Down> :echo "no!" <CR>

"vroom plugin customization
let g:vroom_map_keys = 0 

silent! map <unique> <Leader>t :VroomRunTestFile<CR>
silent! map <unique> <Leader>T :VroomRunNearestTest<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction

inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

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

