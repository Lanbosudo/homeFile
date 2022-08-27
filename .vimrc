" original settings, including nocompatible and filetype and syntax...
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal g`\"" |
            \ endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
syntax on
set hlsearch
" unset last search by hitting return
nnoremap <CR> :noh<CR>

set number
set cindent
set cinkeys-=0#
set indentkeys-=0#
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set nobk

nmap ; :
" stop 'Z''Z' from closing file without saving
nmap ZZ zz

" disable the mouse
set mouse=""

" set the statusline
set laststatus=2

" file encoding
set encoding=gbk
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" Set the filetype based on the file's extension, overriding any
" 'filetype' that has already been set
au BufRead,BufNewFile *.tin set filetype=tt

set wildmode=list:longest
