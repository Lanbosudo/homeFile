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

set t_Co=256
" syntax enable
set background=dark
colorscheme solarized

" file encoding
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" remap the ESC and leader key(used for replace Ctrl)
let mapleader = ","
nmap ; :

" stop 'Z''Z' from closing file without saving
nmap ZZ zz
nnoremap <leader>cd :lcd %:p:h<CR>:pwd<CR>

" unset last search by hitting return
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

"backspace
set backspace=indent,eol,start

" set wildmenu		" show the waiting-for-selected items on statusline
"                    >_< (hard to find)
"                    prefer  now
set wildmode=list:longest

" set the window size
set winheight=10
set winwidth=70

" set the closed buffer to hid instead of unactive, which makes the changes
" remains
set hidden

" disable the mouse
set mouse=""

" set the statusline
set laststatus=2

" set fold flag background black
highlight Folded guibg=black
" set to auto save and load the fold infor
" au BufWinLeave *.* silent mkview
" au BufWinEnter *.* silent loadview
autocmd BufEnter * silent! lcd %:p:h


"""""""""""""""""""""""""""""""""""""""
filetype off
" about the git or curl of vundle plugin
" set rtp+=D:/Vim/vimfiles/.vim/bundle/vundle/
" trying to move the rtp but failed
set rtp+=~/vimfiles/bundle/Vundle.vim/
call vundle#begin('~/vimfiles/bundle/')

" let Vundle manage Vundle
" required!
Plugin 'VundleVim/Vundle.vim'
"""""""""""""""""""""""""""""""""""""""
" My Bundles here:

"
" Track the engine (works on Vim 7.4 +)
if has('gui_running')
else
    " next generation of neocomplcache
    Plugin 'Shougo/neocomplete.vim'

    " Plugin 'SirVer/ultisnips'
    " Snippets are separated from the engine. Add this if you want them:
    " Plugin 'honza/vim-snippets'
endif
"
" Light statusline
Plugin 'vim-airline/vim-airline'
"
" Vim tag management
Plugin 'vim-easytags'
" Plugin 'majutsushi/tagbar'
Plugin 'xolox/vim-misc'

" vim-scripts repos
Plugin 'ctrlp.vim'
" buffer manager
Plugin 'bufexplorer.zip'

" Skip through codes
Plugin 'EasyMotion'

" Org mode support
Plugin 'vim-orgmode'
Plugin 'speeddating.vim'
Plugin 'NrrwRgn'

" non github repos
" Plugin 'git://git.wincent.com/command-t.git'
"""""""""""""""""""""""""""""""""""""""
call vundle#end()               " required!
filetype plugin indent on     " required!
"
"""""""""""""""""""""""""""""""""""""""
" neocomplete setting
let g:neocomplete#enable_at_startup = 1

""""""""""""""""""""""""""""""""""""""
" ctrlp option
let g:ctrlp_show_hidden = 1
let g:ctrlp_regexp = 0
let g:ctrlp_match_window_bottom = 1

""""""""""""""""""""""""""""""""""""""
" BuffExplorer option
let g:bufExplorerShowUnlisted=1      " Show unlisted buffers.
""""""""""""""""""""""""""""""""""""""
" vim-airline
" silent! call airline#extensions#whitespace#disable()
"let g:airline#extensions#whitespace#checks = [ 'indent', 'mixed-indent-file' ]
"let g:airline#extensions#tagbar#enabled = 0
let g:airline_powerline_fonts = 1
""""""""""""""""""""""""""""""""""""""
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"

let g:UltiSnipsEditSplit="context"
let g:UltiSnipsSnippetsDir="~/vimfiles/bundle/vim-snippets/UltiSnips/"
""""""""""""""""""""""""""""""""""""""
set tags=./tags;
let g:easytags_dynamic_files = 1
""""""""""""""""""""""""""""""""""""""
let g:org_agenda_files=['~/org/work.org']
