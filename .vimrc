" original settings, including nocompatible and filetype and syntax...
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal g`\"" |
            \ endif

" set language (vim80 set language to chinese)
set langmenu=en_GB.UTF-8

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
syntax on
set hlsearch

" file encoding
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" remap the ESC and leader key(used for replace Ctrl)
let mapleader = ","
nmap ; :
" stop 'Z''Z' from closing file without saving
nmap ZZ zz
nnoremap <CR> :noh<CR>

set history=50        " keep 50 lines of command line history
set ruler        " show the cursor position on statuline all the time
set showcmd        " display incomplete commands
set incsearch        " do incremental searching

set number
set cindent
set cinkeys-=0#
set indentkeys-=0#
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set nobk

set background=dark
colorscheme solarized

set wildmode=list:longest
" set ignorecase
set wildignorecase

" set the closed buffer to hid instead of unactive, which makes the changes
" remains
set hidden

" set the statusline
set laststatus=2

" set fold flag background black
highlight Folded guibg=black
" set to auto save and load the fold infor
autocmd BufWinLeave _vimrc mkview
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter _vimrc silent loadview
autocmd BufWinEnter *.* silent loadview
autocmd BufEnter * silent! lcd %:p:h

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle Plugin
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"""""""""""""""""""""""""""""""""""""""
" My Bundles here:
" next generation of neocomplcache
Plugin 'Shougo/neocomplete.vim'
" Code block completion
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
" Light statusline
Plugin 'vim-airline/vim-airline'
" Vim tag management
" Plugin 'majutsushi/tagbar'
" Plugin 'ludovicchabant/vim-gutentags.git'

Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-shell'
Plugin 'airblade/vim-rooter'
" Project directory tree
Plugin 'scrooloose/nerdtree'

" vim-scripts repos

Plugin 'ctrlp.vim'
" buffer manager
Plugin 'bufexplorer.zip'
" Skip through codes
Plugin 'EasyMotion'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

""""""""""""""""""""""""""""""""""""""""""
" Plugins configuration

" neocomplete setting
let g:neocomplete#enable_at_startup = 1

" ctrlp option
let g:ctrlp_show_hidden = 1
let g:ctrlp_regexp = 0
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

if executable('grep')
    let g:ctrlp_user_command =
                \ 'find %s -type f |grep -v -E "\.jpg$|/tmp/"'          " MacOSX/Linux
endif

" vim-airline
" symbols
let g:airline_powerline_fonts = 1


" ultisnips & vim-snippets
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"
let g:UltiSnipsEditSplit="context"
"let g:UltiSnipsSnippetsDir="~/vimfiles/bundle/vim-snippets/UltiSnips/"

" vim-easytags
" set tags=./tags;
" let g:easytags_dynamic_files = 1
let g:easytags_dynamic_files = 2
let gitroot = system("git rev-parse --show-superproject-working-tree --show-toplevel | tail -n1 | tr -d '\\n'")
autocmd BufReadPre,FileReadPre * execute !empty(gitroot) ? 'setl tags=' . gitroot . "/.git/vimtags" : 'setl tags=~/.vimtags'
