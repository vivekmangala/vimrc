" Prerequisites:
" ===============
" git clone https://github.com/vim-airline/vim-airline ~/.vim/pack/dist/start/vim-airline
" git clone https://github.com/tpope/vim-fugitive.git ~/.vim/pack/dist/start/vim-fugitive
" git clone https://github.com/cdelledonne/vim-cmake.git ~/.vim/pack/dist/start/vim-cmake
" mkdir ~/.vim/undo
"-----------------------------------------------------------------------------------------
set encoding=utf-8
set nocompatible " be iMproved, required
filetype plugin indent on "Enabling Plugin & Indent
syntax on "Turning Syntax On
set autoread
set wildmenu
"set number relativenumber "Setting relative line numbers
"set nu rnu
set number
set nowrap
set ruler
set title
"set spelllang=en_us
"set spell
set backspace=indent,eol,start "Making sure backspace works
set noruler "Setting up rulers & spacing, tabs
set confirm
set incsearch "Highlights while typing search term 
set undofile "Maintain undo history between sessions
set undodir=~/.vim/undo " Make sure the directory exists
set laststatus=2
"set statusline=%f%m%r%h%w\ [%Y]\ [0x%02.2B]%<\ %F%4v,%4l\ %3p%%\ of\ %L\ lines
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab smarttab
set cindent           " enable specific indenting for C code
set cino+=j1,(0,ws,Ws " enable partial c++11 (lambda) support
color slate
autocmd BufNewFile,BufRead *.puml set syntax=puml
au FileType php setl ofu=phpcomplete#CompletePHP
au FileType ruby,eruby setl ofu=rubycomplete#Complete
au FileType html,xhtml setl ofu=htmlcomplete#CompleteTags
au FileType c setl ofu=ccomplete#CompleteCpp
au FileType css setl ofu=csscomplete#CompleteCSS
" Code folding
"set foldmarker={,}
"set foldmethod=marker
set foldmethod=syntax
set foldlevel=1

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

"GIT merge conflict highlighter
"https://vi.stackexchange.com/questions/19639/change-background-color-of-git-conflict-marker-sections
function! ConflictsHighlight() abort
    syn region conflictStart start=/^<<<<<<< .*$/ end=/^\ze\(=======$\||||||||\)/
    syn region conflictMiddle start=/^||||||| .*$/ end=/^\ze=======$/
    syn region conflictEnd start=/^\(=======$\||||||| |\)/ end=/^>>>>>>> .*$/

    highlight conflictStart ctermbg=red ctermfg=black
    highlight conflictMiddle ctermbg=blue ctermfg=black
    highlight conflictEnd ctermbg=green cterm=bold ctermfg=black
endfunction

augroup MyColors
    autocmd!
    autocmd BufEnter * call ConflictsHighlight()
augroup END

"airline plugins enabled
let g:airline_powerline_fonts = 1
let g:airline#extensions#fugitive#enabled = 1
let g:airline#extensions#branch#enabled = 1
"let g:airline_detect_iminsert = 1
"let g:airline#extensions#branch#empty_message = 'NO GIT' "when no git branch 

